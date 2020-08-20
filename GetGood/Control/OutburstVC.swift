//
//  OutburstVC.swift
//  GetGood
//
//  Created by Hiago Chagas on 12/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class OutburstVC: UIViewController {
    let outburstView = OutburstView()
    private var outburstRepository = OutburstRepository()
    var user: String {
        return UserDefaults.standard.string(forKey: "userName") ?? "Swift"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let savedOutburstsTap = UITapGestureRecognizer(target: self, action: #selector(visualizeSavedOutbursts))
        outburstView.savedOutburstBtn.addGestureRecognizer(savedOutburstsTap)
        let saveOutburstTap = UITapGestureRecognizer(target: self, action: #selector(saveOutburst))
        outburstView.saveButton.addGestureRecognizer(saveOutburstTap)
        let burnOutburstTap = UITapGestureRecognizer(target: self, action: #selector(burnOutburst))
        outburstView.burnButton.addGestureRecognizer(burnOutburstTap)
        
        view = outburstView
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        outburstView.receptionLbl.text = "Hey, \(user)"
    }
    
    @objc func saveOutburst(){
        let newOutburst = outburstRepository.createNewItem()
            newOutburst.text = self.outburstView.textField.text
        outburstRepository.update(item: newOutburst)
        self.outburstView.textField.text = "Placeholder"
        showOutbursts()
    }
    
    @objc func burnOutburst(){
        print("The outburst will burn!!!!")
        self.outburstView.textField.text = ""
    }
    
    @objc func visualizeSavedOutbursts(){
        showOutbursts()
    }
    
    func showOutbursts(){
        let myVC = SavedOutburstsVC(repository: outburstRepository)
        let navController = UINavigationController(rootViewController: myVC)
        self.navigationController?.present(navController, animated: true, completion: nil)
    }
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
