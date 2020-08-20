//
//  SavedOutburstsVC.swift
//  GetGood
//
//  Created by Hiago Chagas on 19/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class SavedOutburstsVC: UIViewController {
    let savedView = SavedOutbursts()
    private let outburstRepository: OutburstRepository
    
    init(repository: OutburstRepository){
        self.outburstRepository = repository
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        self.view = savedView
    }
    
    @objc func dismissModal(){
        self.dismiss(animated: true, completion: nil)
    }
}

extension SavedOutburstsVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return outburstRepository.readAllItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "outburstCell", for: indexPath) as? SavedOutburstTableViewCell
            cell?.textField.text = outburstRepository.readAllItems()[indexPath.row].text
        return cell ?? SavedOutburstTableViewCell()
    }
    
}
