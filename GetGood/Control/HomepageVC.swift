//
//  HomepageVC.swift
//  GetGood
//
//  Created by Hiago Chagas on 12/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class HomepageVC: UIViewController {
    let homeView = HomeView()
    var randomQuote: Quote?
    let quote = QuoteRequest()
    var user: String {
        return UserDefaults.standard.string(forKey: "userName") ?? "Swift"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        quote.fetchQuotes { (quotes, error) in
            DispatchQueue.main.async {
                let randomNumber = Int.random(in: 0..<quotes!.count)
                self.randomQuote = (quotes?[randomNumber] )!
                self.homeView.authorLabel.text =  "- \(self.randomQuote?.author ?? "Author Unknown")"
                self.homeView.citationLabel.text = "\"\(self.randomQuote!.text)\""
                }
        }
        view = homeView
    }
    override func viewWillAppear(_ animated: Bool) {
        self.homeView.receptionLbl.text = "Hi, \(self.user) 👋"
    }
}
