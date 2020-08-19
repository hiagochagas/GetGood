//
//  MoodVC.swift
//  GetGood
//
//  Created by Hiago Chagas on 12/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//
import Foundation
import UIKit

class MoodVC: UIViewController {
    let moods = getMoods()
    let mood = MoodView()
    
    var user = UserDefaults.standard.value(forKey: "userName") as! String {
        didSet{
            DispatchQueue.main.async {
                self.mood.receptionLbl.text = "Hey, \(self.user)"
            }
        }
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        mood.tableView.delegate = self
        mood.tableView.dataSource = self
        getNameAlert()
        view = mood
    }
    
    func getNameAlert(){
        var isFirstLaunch: Bool = (UserDefaults.standard.value(forKey: "FirstLaunch") as? Bool) ?? true
        isFirstLaunch = true
        if(isFirstLaunch){
            UserDefaults.standard.set(false, forKey: "FirstLaunch")
            //pop up alert to get the name of the user
            let alert = UIAlertController(title: "Welcome!", message: "Can you say your name to me?", preferredStyle: .alert)
            alert.addTextField(configurationHandler: {
                (textField) -> Void in
            })
            alert.addAction(UIAlertAction(title: "Save", style: .default, handler: {
                (action) -> Void in
                //does stuff on click on save
                let userNameFromTextField = alert.textFields![0] as UITextField
                self.user = userNameFromTextField.text ?? "No name has been atributed"
                UserDefaults.standard.set(userNameFromTextField.text, forKey: "userName")
            }))
            print("present alert")
            present(alert, animated: true, completion: nil)
        }
    }
    

}
extension MoodVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moodCell", for: indexPath) as! MoodTableViewCell
        cell.mood = moods[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //present with a navigation controller
        let myVC = MoodDetailVC()
        let navController = UINavigationController(rootViewController: myVC)
            myVC.moodView.moodName.text = moods[indexPath.row].moodName
            myVC.moodView.moodDescription.text = moods[indexPath.row].moodDescription
            myVC.moodView.whatToDo.text = moods[indexPath.row].waysToFeelBetter
        self.navigationController?.present(navController, animated: true, completion: nil)
    }
    
}
