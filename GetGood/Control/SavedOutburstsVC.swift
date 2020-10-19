//
//  SavedOutburstsVC.swift
//  GetGood
//
//  Created by Hiago Chagas on 19/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit
import CoreData

class SavedOutburstsVC: UIViewController {
    let savedView = SavedOutbursts()
    let context = AppDelegate.viewContext
    
    var outbursts: [Outburst]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = .init(barButtonSystemItem: .cancel, target: self, action: #selector(dismissModal))
        self.navigationController?.navigationBar.tintColor = .actionOrange
        //makes the NavBar invisible
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
       
        // Do any additional setup after loading the view.
        savedView.tableView.delegate = self
        savedView.tableView.dataSource = self
        //sets the height of row because it wasn't appearing
        savedView.tableView.rowHeight = 200
        
        fetchOutbursts()
            
        
        self.view = savedView
        
    }
    func fetchOutbursts() {
        self.outbursts = Outburst.fetchAll(viewContext: context)
        savedView.tableView.reloadData()
    }
    
    @objc func dismissModal(){
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension SavedOutburstsVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return outbursts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let outburst = self.outbursts![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "outburstCell", for: indexPath) as? SavedOutburstTableViewCell
            cell?.textField.text = outburst.text
        return cell ?? SavedOutburstTableViewCell()
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            let outburstToRemove = self.outbursts![indexPath.row]
            self.context.delete(outburstToRemove)
            do {
                try self.context.save()
            } catch {
                print("You got the \(error) error when deleting from table view")
            }
            self.fetchOutbursts()
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
}
