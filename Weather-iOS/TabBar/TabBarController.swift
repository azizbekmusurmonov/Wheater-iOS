//
//  TabBarController.swift
//  Weather-iOS
//
//  Created by Azizbek Musurmonov   on 05/10/25.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    private func setupTabs() {
        let homeVC = UIViewController()
        homeVC.view.backgroundColor = .systemBackground
        homeVC.title = "Home"
        
        let cityVC = UIViewController()
        cityVC.view.backgroundColor = .systemBackground
        cityVC.title = "City"
        
        let moreVC = UIViewController()
        moreVC.view.backgroundColor = .systemBackground
        moreVC.title = "More"
        
        let profileVC = UIViewController()
        profileVC.view.backgroundColor = .systemBackground
        profileVC.title = "Profile"
        
        // iOS versiya tekshirish
        if #available(iOS 15.0, *) {
            homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
            cityVC.tabBarItem = UITabBarItem(title: "City", image: UIImage(systemName: "building.2.fill"), tag: 1)
            moreVC.tabBarItem = UITabBarItem(title: "More", image: UIImage(systemName: "ellipsis.circle.fill"), tag: 2)
            profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle.fill"), tag: 3)
        } else {
            // eski iOS uchun — o‘zing tashlagan rasmlar ishlatiladi
            homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
            cityVC.tabBarItem = UITabBarItem(title: "City", image: UIImage(named: "city"), tag: 1)
            moreVC.tabBarItem = UITabBarItem(title: "More", image: UIImage(named: "more"), tag: 2)
            profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile"), tag: 3)
        }
        
        viewControllers = [
            UINavigationController(rootViewController: homeVC),
            UINavigationController(rootViewController: cityVC),
            UINavigationController(rootViewController: moreVC),
            UINavigationController(rootViewController: profileVC)
        ]
    }
}


class SystemTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        
        tabBar.tintColor = .label                  // tanlangan icon matn rangi (oq/qora)
        tabBar.unselectedItemTintColor = .secondaryLabel // tanlanmagan icon rangi
        tabBar.backgroundColor = .systemBackground
    }
    
    private func setupTabs() {
        let homeVC = HomeViewController()
        let cityVC = CityViewController()
        let moreVC = MoreViewController()
        let profileVC = ProfileViewController()
        
        homeVC.tabBarItem = UITabBarItem(title: "Home",
                                         image: UIImage(systemName: "house"),
                                         selectedImage: UIImage(systemName: "house.fill"))
        
        cityVC.tabBarItem = UITabBarItem(title: "City",
                                         image: UIImage(systemName: "building.2"),
                                         selectedImage: UIImage(systemName: "building.2.fill"))
        
        moreVC.tabBarItem = UITabBarItem(title: "More",
                                         image: UIImage(systemName: "ellipsis.circle"),
                                         selectedImage: UIImage(systemName: "ellipsis.circle.fill"))
        
        profileVC.tabBarItem = UITabBarItem(title: "Profile",
                                            image: UIImage(systemName: "person"),
                                            selectedImage: UIImage(systemName: "person.fill"))
        
        setViewControllers([homeVC, cityVC, moreVC, profileVC].map {
            UINavigationController(rootViewController: $0)
        }, animated: false)
    }
}

#Preview() {
    SystemTabBarController()
}
