//
//  TabBarVC.swift
//  GetGood
//
//  Created by Hiago Chagas on 12/08/20.
//  Copyright © 2020 Hiago Chagas. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        self.tabBar.tintColor = #colorLiteral(red: 0.7490196078, green: 0.3529411765, blue: 0.9490196078, alpha: 1)
        self.tabBar.barTintColor = .black
    }
    func setupTabBar(){
        let moodViewController = setupVc(rootViewController: MoodVC(), image: UIImage(systemName: "heart.fill")!, title: "Mood")
        let homeViewController = setupVc(rootViewController: HomepageVC(), image: UIImage(systemName: "house.fill")!, title: "Home")
        let outburstViewController = setupVc(rootViewController: OutburstVC(), image: UIImage(systemName: "plus.circle.fill")!, title: "Outburst")
        viewControllers = [moodViewController, homeViewController, outburstViewController]
    }
    func setupVc(rootViewController: UIViewController, image: UIImage, title: String) -> UINavigationController{
        let viewController = UINavigationController(rootViewController: rootViewController)
        viewController.navigationBar.isHidden = true
        viewController.tabBarItem.image = image
        viewController.tabBarItem.selectedImage = image
        viewController.title = title
        return viewController
    }
}
