//
//  MoodView.swift
//  GetGood
//
//  Created by Hiago Chagas on 12/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class MoodView: UIView {
    var tableView = MoodTableView()
    
    let moods = getMoods()
    
    let receptionLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Hey, John"
        lbl.font = .rounded(ofSize: 36, weight: .regular)
        lbl.textColor = .white
        return lbl
    }()
    
    let descriptionReceptionLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "How are you feeling today?"
        lbl.font = .rounded(ofSize: 24, weight: .thin)
        lbl.textColor = .white
        return lbl
    }()
    
    func setupLayout(){
        addSubview(receptionLbl)
        receptionLbl.translatesAutoresizingMaskIntoConstraints = false
        receptionLbl.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 30).isActive = true
        receptionLbl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: safeAreaInsets.top + 36).isActive = true
        
        addSubview(descriptionReceptionLbl)
        descriptionReceptionLbl.translatesAutoresizingMaskIntoConstraints = false
        descriptionReceptionLbl.leftAnchor.constraint(equalTo: receptionLbl.leftAnchor).isActive = true
        descriptionReceptionLbl.topAnchor.constraint(equalTo: receptionLbl.bottomAnchor, constant: 5).isActive = true

        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: descriptionReceptionLbl.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 30).isActive = true
        tableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -30).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.delegate = self
        tableView.dataSource = self

        
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MoodView: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moodCell", for: indexPath) as! MoodTableViewCell
        cell.mood = moods[indexPath.row]
        return cell
    }
   
}
