//
//  URLS.swift
//  Weather-iOS
//
//  Created by Azizbek Musurmonov   on 03/10/25.
//

import Foundation

class URLS {
    
    
    public static let BASE_URL_SOCKET = "https://api.sello.uz/"
    
    public static let BASE_URL_DEV = "https://dev-api.sello.uz/"
    
    public static let BASE_URL_USER = "https://api.sello.uz/"
    
    public static let BASE_COUNTRY_URL = "https://restcountries.com/v3.1?userid=3940"
    
    public static var BASE_URL = SharedManager.getDeveloperModeOn() ? BASE_URL_USER : BASE_URL_USER
    
    public static func reload() {
        BASE_URL = SharedManager.getDeveloperModeOn() ? BASE_URL_USER : BASE_URL_USER
    }
    
    static func path(_ route: ApiRouter) -> String {
        
        switch route {
        
        case .test : return BASE_URL + "/test"
            
        case .login: return BASE_URL + "/login"
            
        case .countryList : return BASE_COUNTRY_URL + "all"
            
        case .refreshToken : return ""
        }
        
    }
    
}
