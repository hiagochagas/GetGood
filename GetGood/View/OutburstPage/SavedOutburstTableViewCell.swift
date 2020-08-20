//
//  SavedOutburstTableViewCell.swift
//  GetGood
//
//  Created by Hiago Chagas on 19/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class SavedOutburstTableViewCell: UITableViewCell {
    let textField: UITextView = {
        let txt = UITextView()
            txt.backgroundColor = .royalPink
            txt.textColor = .white
            txt.font = .rounded(ofSize: 20, weight: .regular)
            txt.text = "Placeholder"
            txt.isEditable = false
            txt.layer.cornerRadius = 10
        return txt
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        textField.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -20).isActive = true
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
