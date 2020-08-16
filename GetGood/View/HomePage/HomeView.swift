//
//  HomeView.swift
//  GetGood
//
//  Created by Hiago Chagas on 13/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class HomeView: UIView {
    
    let receptionLbl: UILabel = {
        let lbl = UILabel()
            lbl.text = "Hi, John 👋"
            lbl.font = .rounded(ofSize: 36, weight: .regular)
            lbl.textColor = .white
        return lbl
    }()
    
    let descriptionReceptionLbl: UILabel = {
        let lbl = UILabel()
            lbl.text = "Hope you are doing fine!"
            lbl.font = .rounded(ofSize: 24, weight: .thin)
            lbl.textColor = .white
        return lbl
    }()
    let bookLabel: UILabel = {
        let lbl = UILabel()
            lbl.text = "📖"
            lbl.font = .rounded(ofSize: 116, weight: .regular)
        return lbl
    }()
    let citationLabel: UILabel = {
        let lbl = UILabel()
            lbl.text = "\"Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet\""
            lbl.font = .rounded(ofSize: 24, weight: .regular)
            lbl.textColor = .white
            lbl.numberOfLines = 0
        return lbl
    }()
    
    let authorLabel: UILabel = {
        let lbl = UILabel()
            lbl.text = "- John Appleseed"
            lbl.font = .rounded(ofSize: 24, weight: .regular)
            lbl.textColor = .white
        return lbl
    }()
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.axis = .vertical
        stack.spacing = 30
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(receptionLbl)
        receptionLbl.translatesAutoresizingMaskIntoConstraints = false
        receptionLbl.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 30).isActive = true
        receptionLbl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: safeAreaInsets.top + 36).isActive = true
        
        addSubview(descriptionReceptionLbl)
        descriptionReceptionLbl.translatesAutoresizingMaskIntoConstraints = false
        descriptionReceptionLbl.leftAnchor.constraint(equalTo: receptionLbl.leftAnchor).isActive = true
        descriptionReceptionLbl.topAnchor.constraint(equalTo: receptionLbl.bottomAnchor, constant: 5).isActive = true
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(greaterThanOrEqualTo: descriptionReceptionLbl.bottomAnchor,constant: 30).isActive = true
        stackView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 30).isActive = true
        stackView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -30).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        //stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(bookLabel)
        
        stackView.addArrangedSubview(citationLabel)
        stackView.addArrangedSubview(authorLabel)
        //stackView.addArrangedSubview(UIView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
