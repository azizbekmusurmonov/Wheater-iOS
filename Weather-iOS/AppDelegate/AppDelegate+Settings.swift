//
//  AppDelegate+Settings.swift
//  Weather-iOS
//
//  Created by Azizbek Musurmonov   on 02/10/25.
//

import UIKit
import UserNotifications

extension AppDelegate {
    
    func initConnection() {
        ConnectionManager.sharedInstance.startHost()
    }
    
    //API KEYS, THEME, LANGUAGE etc
    internal func initBaseSettings() {
        SettingManager.setBaseSettings()

    }
    
    internal func handleAppOpenFromUrl(_ url: String) {
        
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        Messaging.messaging().apnsToken = deviceToken
//#if DEBUG
//        Messaging.messaging().setAPNSToken(deviceToken, type: .sandbox)
//#else
//        Messaging.messaging().setAPNSToken(deviceToken, type: .prod)
//#endif
        
    }
    
    public func unsubscribeFromNews() {
        subscriptionSwitch(on: false)
    }
    
    private func subscriptionSwitch(on: Bool) {
        
//        if on {
//
//            Messaging.messaging().subscribe(toTopic: "sello_notification_all")
//            Messaging.messaging().subscribe(toTopic: "sello_notification_ios")
//            Messaging.messaging().delegate = self
//
//        }else{
//            Messaging.messaging().unsubscribe(fromTopic:"sello_notification_all")
//            Messaging.messaging().unsubscribe(fromTopic:"sello_notification_ios")
//
//        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        
        print(userInfo)
        if let attachmmentDictionary = userInfo["fcm_options"] as? [String: String] {
            print("IMAGE DIC", attachmmentDictionary)
        }
        
        
        completionHandler([[.alert, .sound]])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        
        var senderProductSlug: String? = nil
        
        print(userInfo)
        if let attachmmentDictionary = userInfo["fcm_options"] as? [String: String] {
            print("IMAGE DIC", attachmmentDictionary)
        }
        
        if let productSlug = userInfo["gcm.notification.notification_id"] as? String {
            senderProductSlug = productSlug
            print("PRODUCT SLUG", productSlug)
        }
        if let productSlug = userInfo["link"] as? String {
            senderProductSlug = productSlug
            print("PRODUCT SLUG", productSlug)
            AppLinkManager.shared.handle(productSlug)
        }
        
        defer {
            completionHandler()
        }
        
       // handle
    }
}

extension AppDelegate {
    
    func configureFirebase(application: UIApplication, always: Bool = false)  {
        
//        if always {
//
//            Messaging.messaging().delegate = self
//
//        }
//
//        Messaging.messaging().subscribe(toTopic: "sello_notification_all")
//
//        Messaging.messaging().subscribe(toTopic: "sello_notification_ios")
//
//
        if #available(iOS 10.0, *) {
            
            UNUserNotificationCenter.current().delegate = self
            
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        } else {
            let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            
            application.registerUserNotificationSettings(settings)
        }
        
        application.registerForRemoteNotifications()
    }
    
    func removeFirebase(application: UIApplication)   {
//
//        Messaging.messaging().unsubscribe(fromTopic: "sello_notification_all")
//
//        Messaging.messaging().unsubscribe(fromTopic: "sello_notification_ios")
//
//        Messaging.messaging().unsubscribe(fromTopic: "test")
        
    }
    
//    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
//        print("Firebase registration token: \(String(describing: fcmToken))")
//
//        print("messaging = \(messaging)")
//
////        SharedManager.setFirebaseToken(fcmToken ?? "")
////        SettingManager.updateFCMToken()
//    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("didFailToRegisterForRemoteNotificationsWithError \(error.localizedDescription)"  )
    }
    
    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification userInfo: [AnyHashable : Any], completionHandler: @escaping () -> Void) {
        print("handleActionWithIdentifier \(userInfo)")
        
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("didReceiveRemoteNotificationUserInfo = \(userInfo)")
        
        completionHandler(.newData)
    }
    
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
    
        if nil != userActivity.webpageURL {
            AppLinkManager.shared.handle(userActivity.webpageURL)
            return true
        }
        return false
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        AppLinkManager.shared.handle(url)
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool{
        AppLinkManager.shared.handle(url)
        
//        AppLinkManager.shared.check { linkmodel in
//            switch linkmodel.router {
//            case .notification :
//                self.route(to: .needUpdate)
//            }
//        }
       
        return true
    }
    


}


//{
//  "message":{
//    "token":"bk3RNwTe3H0:CI2k_HHwgIpoDKCIZvvDMExUdFQ3P1...",
//    "data":{
//      "Nick" : "Mario",
//      "body" : "great match!",
//      "Room" : "PortugalVSDenmark",
//        "link" : "https://domain/me/path"
//    }
//  }
//}
