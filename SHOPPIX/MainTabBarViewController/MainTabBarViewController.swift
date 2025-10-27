//
//  MainTabBarViewController.swift
//  SHOPPIX
//
//  Created by Nafea Elkassas on 27/10/2025.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        setupAppearance()
    }
    
    private func setupTabs() {
        //  Create your view controllers
        let homeVC = HomeViewController()
        let accountVC = ProfileViewController()
        
        // Wrap each in UINavigationController
        let homeNav = UINavigationController(rootViewController: homeVC)
        let accountNav = UINavigationController(rootViewController: accountVC)
        
        //  Set tab bar titles and icons
        homeNav.tabBarItem = UITabBarItem(title: "Home",
                                          image: UIImage(systemName: "house"),
                                          selectedImage: UIImage(systemName: "house.fill"))
        
        accountNav.tabBarItem = UITabBarItem(title: "Account",
                                             image: UIImage(systemName: "person.circle"),
                                             selectedImage: UIImage(systemName: "person.circle.fill"))
        
        // Assign to tab bar
        viewControllers = [homeNav, accountNav]
    }
    
    private func setupAppearance() {
        tabBar.tintColor = UIColor.systemBlue
        tabBar.unselectedItemTintColor = UIColor.gray
        tabBar.backgroundColor = UIColor.white
    }
}
