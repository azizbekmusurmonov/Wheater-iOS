//
//  APIRouter+Querries.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Foundation
import Alamofire

extension ApiRouter {
    
    internal var queries: Parameters? {
        
        switch self {
        case .test: return nil
        case .refreshToken: return nil
        case .login: return nil
        case .countryList : return nil
        //default : return nil
        }
    }
    
}
