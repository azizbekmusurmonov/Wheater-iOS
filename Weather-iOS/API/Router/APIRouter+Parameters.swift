//
//  APIRouter+Parameters.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Foundation
import Alamofire

extension ApiRouter {
    
    //MARK: BODY
    internal var parameters: Parameters? {
        
        switch self {
        case .test: return nil
        case .login: return nil
        case .refreshToken : return nil
        case .countryList : return nil
        }
    }
    
}
