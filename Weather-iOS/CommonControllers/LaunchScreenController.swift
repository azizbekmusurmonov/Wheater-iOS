//
//  LaunchScreenController.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit
import Lottie

class LaunchScreenController: ViewController {
    
    private var animationView = LottieAnimationView()
    
    private var isAnimationFinished: Bool = false
        
    private var updateModel: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .colorBackground
        self.initAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.animationView.play()
        UIView.animate(withDuration: 0.5, delay: 3.0, options: [.curveEaseInOut], animations: {
            self.view.backgroundColor = .colorMain
        }, completion: { finished in
            self.isAnimationFinished = true
            self.handleStartApp()
        })
    }
    
    private func initAnimation() {
        self.animationView = .init(name: "wellcome")
        animationView.frame = CGRect(x: 0, y: windowWidth * 0.3, width: windowWidth, height: windowHeight * 0.5)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        self.view.addSubview(animationView)
    }
    
    
    private func checkIosVersion() {
//        APIClient.checkVersion { (model) in
//            self.isResponseGot = true
//            if let error = model {
//                if error.type != .needUpdate {
//                    self.goToMain()
//        appDelegate.route(to: .needUpdate)
//                }
//            } else {
                self.goToMain()
//            }
//        }
        
    
    }
    
  
    private func handleStartApp() {
        if UIDevice.current.isJailBroken {
            appDelegate.route(to: .deviceUnsafe)
        } else {
            self.checkIosVersion()
        }
    }
    
    private func goToMain() {
        appDelegate.initConnection()
//        if SharedManager.hasLastNotifSlug() {
//            appDelegate.route(to: .notification)
//        } else {
            appDelegate.route(to: .main)
//        }
    }
    
}
