//
//  ConnectionManager.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit
import Network

class ConnectionManager : NSObject {
    
    var onConnect: ((Bool) -> Void)?
    
    private let monitor = NWPathMonitor()
    
    private var mode: ConnectionHandleType = .global
    
    
    static let sharedInstance: ConnectionManager = {
        return ConnectionManager(.automatic)
    }()
    
    
    override init() {
        super.init()
        //self.startHost()
    }
    
    init(_ mode: ConnectionHandleType) {
        super.init()
        self.mode = mode
        //self.startHost()
    }
    
    
    internal func handleRoot() {
        switch self.mode {
        case .local :
            self.onConnect?(true)
        case .global:
            self.onConnect?(true)
                        appDelegate.connectedFromNetwork()
        case .automatic:
            self.onConnect?(true)
            appDelegate.connectedFromNetwork()
        }
    }
    
    internal func handleOpen() {
        switch self.mode {
        case .local :
            self.onConnect?(false)
        case .global:
            self.onConnect?(false)
        case .automatic:
            self.onConnect?(false)
        }
        appDelegate.route(to: .internetUnavaiable)
    }
    
    func startHost() {
        monitor.pathUpdateHandler = { path in
            var connected: Bool = false
            if path.status == .satisfied {
                connected = true
                DispatchQueue.main.async {
                    self.handleRoot()
                }
                print("Connected to the internet")
                // Perform actions when connected
            } else {
                connected = false
                DispatchQueue.main.async {
                    self.handleOpen()
                }
                print("Disconnected from the internet")
                // Perform actions when disconnected
            }
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: .notificationConnectionChange, object: nil, userInfo: [String.dictionaryKeyUserInfo: [String.dictionaryKeyConnected: connected]])
            }
        }
        
        let queue = DispatchQueue(label: "NetworkMonitor", qos: .userInitiated)
        monitor.start(queue: queue)
    }
    
    
    
}

enum ConnectionHandleType {
    
    case global
    case local
    //no need additonal handling while using
    case automatic
    
}
