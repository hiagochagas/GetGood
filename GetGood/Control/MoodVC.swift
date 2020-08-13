//
//  MoodVC.swift
//  GetGood
//
//  Created by Hiago Chagas on 12/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class MoodVC: UIViewController {
    let moods = getMoods()
    let mood = MoodView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mood.tableView.delegate = self
        mood.tableView.dataSource = self
        view = mood
        
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
