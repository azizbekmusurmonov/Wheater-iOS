//
//  AppDelegate.swift
//  Weather-iOS
//
//  Created by Azizbek Musurmonov   on 01/10/25.
//

import UIKit

let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    internal var navigationController : UINavigationController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.initBaseSettings()
        
        self.configureWindow()
        
        return true
    }
}

