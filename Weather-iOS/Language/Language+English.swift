//
//  Language+English.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Foundation


extension LanguageKey {
    
    var eng: String {
        switch self {
        case .ok: return "Ok"
        case .done: return "Done"
        case .cancel: return "Cancel"
        case .select: return "Select"
        case .titleLog : return "Api Log"
        }
    }
    
}
