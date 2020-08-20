//
//  MoodDetailView.swift
//  GetGood
//
//  Created by Hiago Chagas on 13/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class MoodDetailView: UIView {
    
    let moodName: UILabel = {
        let lbl = UILabel()
            lbl.text = "Oi"
            lbl.font = .rounded(ofSize: 36, weight: .regular)
            lbl.textColor = .white
        return lbl
    }()
    
    let moodDescription: UILabel = {
        let lbl = UILabel()
            lbl.text = "Lorem lorem lorem lorem lorem lorem lorem"
            lbl.font = .rounded(ofSize: 24, weight: .thin)
            lbl.textColor = .white
            lbl.numberOfLines = 0
        return lbl
    }()
    
    let whatYouCanDo: UILabel = {
        let lbl = UILabel()
            lbl.text = "What can I do?"
            lbl.font = .rounded(ofSize: 36, weight: .regular)
            lbl.textColor = .white
        return lbl
    }()
    
    let whatToDo: UILabel = {
        let lbl = UILabel()
            lbl.text = "Lorem lorem lorem lorem lorem lorem lorem"
            lbl.font = .rounded(ofSize: 24, weight: .thin)
            lbl.textColor = .white
            lbl.numberOfLines = 0
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .darkerPurple
        
        addSubview(moodName)
        moodName.translatesAutoresizingMaskIntoConstraints = false
        moodName.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 30).isActive = true
        moodName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        
        addSubview(moodDescription)
        moodDescription.translatesAutoresizingMaskIntoConstraints = false
        moodDescription.leftAnchor.constraint(equalTo: moodName.leftAnchor).isActive = true
        moodDescription.topAnchor.constraint(equalTo: moodName.bottomAnchor, constant: 14).isActive = true
        moodDescription.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        
        addSubview(whatYouCanDo)
        whatYouCanDo.translatesAutoresizingMaskIntoConstraints = false
        whatYouCanDo.leftAnchor.constraint(equalTo: moodDescription.leftAnchor).isActive = true
        whatYouCanDo.topAnchor.constraint(equalTo: moodDescription.bottomAnchor, constant: 20).isActive = true
        
        addSubview(whatToDo)
        whatToDo.translatesAutoresizingMaskIntoConstraints = false
        whatToDo.leftAnchor.constraint(equalTo: moodDescription.leftAnchor).isActive = true
        whatToDo.topAnchor.constraint(equalTo: whatYouCanDo.bottomAnchor, constant: 14).isActive = true
        whatToDo.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
