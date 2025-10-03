//
//  ConnectionLostViewController.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit
import Lottie

class ConnectionLostViewController: ViewController {

    private var mode: ConnectionType = .disconnected
    
    private var animationView = LottieAnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .colorBackground
       
        self.initViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(onConnectionChange(_ :)), name: .notificationConnectionChange, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.animationView.play()
    }

    internal func initViews() {
        self.initForMode()
    }
    
    private func initAnimation() {
        self.animationView = (self.mode == .disconnected) ? .init(name: "connection") : .init(name: "connectioncheck")
        animationView.frame = CGRect(x: 0, y: windowWidth * 0.3, width: windowWidth, height: windowHeight * 0.5)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        self.view.addSubview(animationView)
        self.animationView.play()
    }
    
    private func initForMode() {
        for vw in self.view.subviews {
            vw.removeFromSuperview()
        }
        self.initAnimation()
    }
    
    @objc func onConnectionChange(_ notification: Notification) {
        if let dict = notification.userInfo?[String.dictionaryKeyUserInfo] as? [String: Any] {
            if let val = dict[String.dictionaryKeyConnected] as? Bool {
                let newMode = ConnectionType(val)
                if newMode != self.mode {
                    self.mode = newMode
                    self.updateAnimation()
                }
            }
        }
    }
    
    private func updateAnimation() {
        self.initForMode()
    }

    enum ConnectionType {
        case connected
        case disconnected
        
        init(_ connection: Bool) {
            self = (connection ? .connected : .disconnected)
        }
    }
}

