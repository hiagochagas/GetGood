//
//  OutburstView.swift
//  GetGood
//
//  Created by Hiago Chagas on 16/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class OutburstView: UIView {
    
    let receptionLbl: UILabel = {
      let lbl = UILabel()
          lbl.text = "Hey, \(UserDefaults.standard.value(forKey: "userName") as? String ?? "John")"
          lbl.font = .rounded(ofSize: 36, weight: .regular)
          lbl.textColor = .white
      return lbl
    }()

    let descriptionReceptionLbl: UILabel = {
      let lbl = UILabel()
          lbl.text = "I am here to help!"
          lbl.font = .rounded(ofSize: 24, weight: .thin)
          lbl.textColor = .white
      return lbl
    }()

    let savedOutburstBtn: UIButton = {
        let btn = UIButton()
            btn.backgroundColor = .clear
            btn.setTitleColor(.actionOrange, for: .normal)
            btn.titleLabel?.font = .rounded(ofSize: 12, weight: .bold)
            btn.setTitle("Saved Outbursts", for: .normal)
        return btn
    }()

    let textField: UITextView = {
        let txt = UITextView()
            txt.backgroundColor = .royalPink
            txt.textColor = .lightGray
            txt.font = .rounded(ofSize: 20, weight: .regular)
            txt.text = "Placeholder"
        return txt
        }()
    
    let saveButton: UIButton = {
        let btn = UIButton()
            btn.setTitle("Save", for: .normal)
            btn.tintColor = .white
            btn.backgroundColor = .actionOrange
        return btn
    }()
    
    let burnButton: UIButton = {
        let btn = UIButton()
            btn.setTitle("Burn", for: .normal)
            btn.tintColor = .white
            btn.backgroundColor = .actionRed
        return btn
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
        
        addSubview(savedOutburstBtn)
        savedOutburstBtn.translatesAutoresizingMaskIntoConstraints = false
        savedOutburstBtn.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -30).isActive = true
        savedOutburstBtn.topAnchor.constraint(equalTo: receptionLbl.bottomAnchor, constant: 3).isActive = true
        
        addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 30).isActive = true
        textField.topAnchor.constraint(equalTo: descriptionReceptionLbl.bottomAnchor, constant: 20).isActive = true
        textField.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -30).isActive = true
        textField.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        textField.delegate = self
                
        addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        saveButton.rightAnchor.constraint(equalTo: textField.rightAnchor).isActive = true
        saveButton.leftAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(burnButton)
        burnButton.translatesAutoresizingMaskIntoConstraints = false
        burnButton.bottomAnchor.constraint(equalTo: saveButton.bottomAnchor).isActive = true
        burnButton.leftAnchor.constraint(equalTo: textField.leftAnchor).isActive = true
        burnButton.rightAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        saveButton.roundCorners(corners: .bottomRight, radius: 10)
        burnButton.roundCorners(corners: .bottomLeft, radius: 10)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension OutburstView: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.textColor = .white
        if textView.text == "Placeholder"{
            textView.text.removeAll()
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty{
            textView.textColor = .lightGray
            textView.text = "Placeholder"
        }
    }
}
