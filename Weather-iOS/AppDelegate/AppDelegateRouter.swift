//
//  AppDelegateRouter.swift
//  Weather-iOS
//
//  Created by Azizbek Musurmonov   on 02/10/25.
//

import UIKit

extension AppDelegate {
    
    internal func configureMainScreen() {
        
        self.navigationController = UINavigationController(rootViewController: CountryListViewController())
        
        window?.rootViewController = self.navigationController
    }
    
    func route(to route : AppDelegateRoute) {
        switch route {
        case .main: self.configureMainScreen()
            
        case .root:
            self.navigationController.popToRootViewController(animated: true)
            
        case .internetUnavaiable:
            self.window?.rootViewController = ConnectionLostViewController()
            
        case .deviceUnsafe:
            self.window?.rootViewController = DeviceUnSafeViewController()
            self.navigationController = nil
            
        case .needUpdate:
            self.window?.rootViewController = AppUpdateViewController()
            self.navigationController = nil
            
        case .spalshScreen:
            self.window?.rootViewController = LaunchScreenController()
        }
    }
    
    func back() {
        self.navigationController.popViewController(animated: true)
    }
    
    func connectedFromNetwork() {
        self.window?.rootViewController = self.navigationController
    }
    
    internal func configureWindow() {
        window = UIWindow(frame: CGRect(x: 0, y: 0, width: windowWidth, height: windowHeight))
        
        self.route(to: .spalshScreen)
        print("TAG_D" , UIDevice.current.ipAddress())
        print("TAG_D" , UIDevice.current.model)
        print("TAG_D" , UIDevice.current.name)
        print("TAG_D" , UIDevice.current.systemName)
        print("TAG_D" , UIDevice.current.systemVersion)
        print("TAG_D" , UIDevice.current.identifierForVendor?.uuidString ?? "")
        
    }
}

enum AppDelegateRoute {
    
    case main
    case root
    case internetUnavaiable
    case deviceUnsafe
    case needUpdate
    case spalshScreen
    
}
