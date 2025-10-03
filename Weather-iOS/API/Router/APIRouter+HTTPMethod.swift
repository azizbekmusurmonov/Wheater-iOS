//
//  APIRouter+HTTPMethod.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Foundation
import Alamofire

//REST | RPC differences 

extension ApiRouter {
    
    internal var method : HTTPMethod {
        switch self {
        case .test : return .get
        case .login : return .post
        case .refreshToken: return .get
        case .countryList: return .get
        }
    }
    
}
