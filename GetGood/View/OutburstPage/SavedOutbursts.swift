//
//  SavedOutbursts.swift
//  GetGood
//
//  Created by Hiago Chagas on 19/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class SavedOutbursts: UIView {
    let receptionLbl: UILabel = {
        let lbl = UILabel()
            lbl.text = "Here are your saved outbursts:"
            lbl.font = .rounded(ofSize: 30, weight: .regular)
            lbl.textColor = .white
            lbl.numberOfLines = 0
        return lbl
    }()
    
    let tableView = SavedOutburstsTableView()
    
    func setupLayout(){
        addSubview(receptionLbl)
        receptionLbl.translatesAutoresizingMaskIntoConstraints = false
        receptionLbl.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 30).isActive = true
        receptionLbl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        receptionLbl.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -30).isActive = true

        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 30).isActive = true
        tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -30).isActive = true
        tableView.topAnchor.constraint(equalTo: receptionLbl.bottomAnchor, constant: 15).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .darkerPurple
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
