//
//  APIClient.swift
//  Weather-iOS
//
//  Created by Azizbek Musurmonov   on 02/10/25.
//

import Foundation


extension ApiClient {
    
    
    static func login(paging: String, completion:@escaping (AErrorModel?)->Void) {
        performRequestJSONE(route: .test, completion: completion)
    }
    
    static func getAllCountries(completion:@escaping ([MCountry]?)->Void)  {
        performRequestJSONECustom(route: .countryList, completion: completion)
    }
    
  
    
}


