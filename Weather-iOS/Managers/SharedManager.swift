//
//  File.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Foundation


struct SharedManager {
    
    static let preference = UserDefaults.standard
    
    static let publicPreference = UserDefaults.init(suiteName: "group.uz.abs.app")
    
    static var appLinkModel : AppLinkModel? {
        get {
            if let merchants = preference.object(forKey: .shared_key_app_link_model) as? Data {
                let decoder = JSONDecoder()
                if let profile = try? decoder.decode(AppLinkModel.self, from: merchants) {
                    return profile
                }
            }
            return nil
        }
        set(obj) {
            if let value = obj, value.isValid {
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(value) {
                    preference.set(encoded, forKey: .shared_key_app_link_model)
                    preference.synchronize()
                }
            } else {
                preference.removeObject(forKey: .shared_key_app_link_model)
                preference.synchronize()
            }
        }
    }
    
    static func setApplicationTheme(_ type: ApplicationThemeMode = .light){
        preference.set(type.rawValue, forKey: .shared_key_app_theme)
        preference.synchronize()
    }
    
    static func isLightMode() -> Bool {
        let type = preference.integer(forKey: .shared_key_app_theme)
        switch type {
        case ApplicationThemeMode.light.rawValue:
            return true
        case ApplicationThemeMode.dark.rawValue:
            return false
        default: return true
        }
    }
    
    static func getApplicationTheme() -> ApplicationThemeMode {
        let type = preference.integer(forKey: .shared_key_app_theme)
        switch type {
        case ApplicationThemeMode.light.rawValue:
            return .light
        case ApplicationThemeMode.dark.rawValue:
            return .dark
        default: return .light
        }
    }
    
    static func getLanguage() -> LanguageEnum {
        let lang = preference.integer(forKey: .shared_key_app_language)
        switch lang {
        case 2: return .russian
        case 1: return .uzbek
        case 3: return .russian
        default: return .russian
        }
    }
    
    static func getLocale() -> String {
        let lang = preference.integer(forKey: .shared_key_app_language)
        switch lang {
        case 2: return "en-US"
        case 1: return "ru-RU"
        case 3: return "ru-RU"
        default: return "ru-RU"
        }
    }
    
    static func getLanguageName() -> String {
        let lang = preference.integer(forKey: .shared_key_app_language)
        switch lang {
        case 2: return "ru"
        case 1: return "uz"
        case 3: return "ru"
        default: return "ru"
        }
    }
    
    static func getLanguageNotSet() -> Bool {
        let lang = preference.integer(forKey: .shared_key_app_language)
        return (lang == 0)
    }
    
    static func setLanguage(_ lang: LanguageEnum){
        preference.set(lang.rawValue, forKey: .shared_key_app_language)
        preference.synchronize()
        publicPreference?.set(lang.rawValue, forKey: .shared_key_app_language)
        publicPreference?.synchronize()
        
       
    }
    
    static func setDeveloperModeOn(_ enable: Bool){
        preference.set(enable, forKey: .shared_key_app_base_url)
        preference.synchronize()
    }
    
    static func getDeveloperModeOn() -> Bool {
        return preference.bool(forKey: .shared_key_app_base_url)
    }
    
    static func addResponse(_ userInfo: SharedResponse) {
        var array : [SharedResponse] = [userInfo]
        if let merchants = preference.object(forKey: .shared_key_app_log_api_data) as? Data {
            let decoder = JSONDecoder()
            if let profile = try? decoder.decode([SharedResponse].self, from: merchants) {
                array.append(contentsOf: profile)
                if array.count > 40 {
                    array.removeLast()
                }
            }
        }
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(array) {
            preference.set(encoded, forKey: .shared_key_app_log_api_data)
            preference.synchronize()

        }
        NotificationCenter.default.post(name: .notificationApiLogSharedDataGot, object: nil)
    }
    
    static func getResponses() -> [SharedResponse] {
        if let merchants = preference.object(forKey: .shared_key_app_log_api_data) as? Data {
            let decoder = JSONDecoder()
            if let profile = try? decoder.decode([SharedResponse].self, from: merchants) {
                return profile
            }
        }
        return []
    }
    
    static func removeResponses() {
        preference.removeObject(forKey: .shared_key_app_log_api_data)
        preference.synchronize()
    }
}
