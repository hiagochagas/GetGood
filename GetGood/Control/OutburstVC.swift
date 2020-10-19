//
//  OutburstVC.swift
//  GetGood
//
//  Created by Hiago Chagas on 12/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class OutburstVC: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let outburstView = OutburstView()
    var user: String {
        return UserDefaults.standard.string(forKey: "userName") ?? "Swift"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let savedOutburstsTap = UITapGestureRecognizer(target: self, action: #selector(visualizeSavedOutbursts))
        outburstView.savedOutburstBtn.addGestureRecognizer(savedOutburstsTap)
        let saveOutburstTap = UITapGestureRecognizer(target: self, action: #selector(saveOutburst))
        outburstView.saveButton.addGestureRecognizer(saveOutburstTap)
        let burnOutburstTap = UITapGestureRecognizer(target: self, action: #selector(burnOutburst))
        outburstView.burnButton.addGestureRecognizer(burnOutburstTap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        
        view = outburstView
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        outburstView.receptionLbl.text = "Hey, \(user)"
    }
    
    @objc func saveOutburst(){
        let resultText = self.outburstView.textField.text
        let newOutburst = Outburst(context: self.context)
            newOutburst.id = UUID()
            newOutburst.text = resultText
            newOutburst.date = Date()
        do{
            try self.context.save()
        } catch {
            print("Error \(error) when saving the data")
        }
        showOutbursts()
    }
    
    @objc func burnOutburst(){
        print("The outburst will burn!!!!")
        self.outburstView.textField.text = ""
    }
    
    @objc func visualizeSavedOutbursts(){
        showOutbursts()
    }
    
    func showOutbursts(){
        let myVC = SavedOutburstsVC()
        let navController = UINavigationController(rootViewController: myVC)
        self.navigationController?.present(navController, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.saveOutburst()
        return true
    }
    @objc func keyboardWillShow(notification: NSNotification){
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
            if let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double{
                UIView.animate(withDuration: duration) {
                    self.view.frame = CGRect(x: UIScreen.main.bounds.origin.x, y: UIScreen.main.bounds.origin.y, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - keyboardSize.height)
                }
                self.view.layoutIfNeeded()
            }
        }
    }
    @objc func keyboardHide(notification: NSNotification){
            if let duracao = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double{
                UIView.animate(withDuration: duracao) {
                    self.view.frame = UIScreen.main.bounds
                     self.view.layoutIfNeeded()
                }
        }
    }
}
