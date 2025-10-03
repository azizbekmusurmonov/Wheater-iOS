//
//  APIRouter+URL.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Foundation

extension ApiRouter {
    
    internal var path : String {
        return URLS.path(self)
    }
    
}
