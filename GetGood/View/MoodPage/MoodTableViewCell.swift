//
//  MoodTableViewCell.swift
//  GetGood
//
//  Created by Hiago Chagas on 12/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class MoodTableViewCell: UITableViewCell {
    var mood: Mood?{
        didSet{
            moodName.text = mood?.moodName
        }
    }
    var bgView: UIView = {
        let view = UIView()
            view.heightAnchor.constraint(equalToConstant: 100).isActive = true
            view.backgroundColor = .royalPink
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOpacity = 0.5
            view.layer.shadowOffset = CGSize(width: 0, height: 1)
            view.layer.shadowRadius = 2
            view.layer.cornerRadius = 10
        return view
    }()
    var moodName: UILabel = {
        let lbl = UILabel()
            lbl.font = .rounded(ofSize: 36, weight: .regular)
            lbl.textColor = .white
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(bgView)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bgView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bgView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        bgView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -20).isActive = true
        
        addSubview(moodName)
        moodName.translatesAutoresizingMaskIntoConstraints = false
        moodName.leftAnchor.constraint(equalTo: bgView.leftAnchor, constant: 23).isActive = true
        moodName.centerYAnchor.constraint(equalTo: bgView.centerYAnchor).isActive = true
        
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
