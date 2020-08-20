//
//  SavedOutburstsTableView.swift
//  GetGood
//
//  Created by Hiago Chagas on 19/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class SavedOutburstsTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableView(){
        self.register(SavedOutburstTableViewCell.self, forCellReuseIdentifier: "outburstCell")
        self.separatorStyle = .none
        self.backgroundColor = .clear
    }

}
