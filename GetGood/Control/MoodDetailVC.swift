//
//  MoodDetailVC.swift
//  GetGood
//
//  Created by Hiago Chagas on 13/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class MoodDetailVC: UIViewController {
    let moodView = MoodDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = .init(barButtonSystemItem: .cancel, target: self, action: #selector(dismissModal))
        self.navigationController?.navigationBar.tintColor = .actionOrange
        //makes the NavBar invisible
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true

        view = moodView
        // Do any additional setup after loading the view.
    }
    @objc func dismissModal(){
        self.dismiss(animated: true, completion: nil)
    }
}
