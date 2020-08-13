//
//  MoodTableView.swift
//  GetGood
//
//  Created by Hiago Chagas on 12/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class MoodTableView: UITableView {
    
    func setupTableView(){
        self.register(MoodTableViewCell.self, forCellReuseIdentifier: "moodCell")
        self.separatorStyle = .none
        self.backgroundColor = .clear
    }
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}

