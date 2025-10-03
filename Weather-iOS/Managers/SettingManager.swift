//
//  SettingManager.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

struct SettingManager {
    
    static func goToAppStore(){
        if let url  = URL(string:"itms-apps://itunes.apple.com/app/sello-uz/id1603818062") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
    
    static func callToSupport() {
//        if let url = URL(string: Constants.SELLO_SUPPORT_CALL_NUMBER), UIApplication.shared.canOpenURL(url) {
//            UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        }
    }
    
    static func setLanguage(){
//        if SharedManager.getLanguageNotSet() {
//            print(Locale.preferredLanguages[0])
//            Bundle.swizzleLocalization()
//            SharedManager.setLanguage(LanguageManager.getSystemLanguage(Locale.preferredLanguages[0]))
//        }
//        if let lastVersion = SharedManager.getAppVersion() {
//            if lastVersion != appCurrentVersion {
//                SharedManager.setAppVersion()
//                SharedManager.clearData()
//            }
//        } else {
//            SharedManager.clearData()
//            SharedManager.setAppVersion()
//        }
    }
    
    static func setBaseSettings() {
        
      
        self.setLanguage()
        ColorManager.shared.initForSetting()
        
        
    }
    
    
    
    
}
