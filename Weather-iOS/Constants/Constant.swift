//
//  Constant.swift
//  Weather-iOS
//
//  Created by Azizbek Musurmonov   on 05/10/25.
//

import Foundation

struct Constant {
    static let mainStorybaord = "Main"
    
    static var OW_API_KEY: String {
        get {
            if let storedKey = KeychainService.getAPIKey() {
                return storedKey
            } else {
                return "555707b60a648234521b877ef252df72"
            }
        }
        set {
            KeychainService.saveAPIKey(newValue)
        }
    }
}

