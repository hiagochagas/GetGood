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
    var user: String {
        return UserDefaults.standard.string(forKey: "userName") ?? "Swift"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = outburstView
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        outburstView.receptionLbl.text = "Hey, \(user)"
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
