//
//  NotificationCenter+Extension.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit


extension Notification.Name {
    
    static let notificationConnectionChange = Notification.Name("app_connection_changed_notification")
    static let notificationApiLogSharedDataGot = Notification.Name("api_shared_log_data_got")
    
}

extension String {
    
    static let dictionaryKeyUserInfo: String = "userInfo"
    static let dictionaryKeyConnected: String = "connected"
    
    
}
