//
//  Language+Uzbek.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Foundation

extension LanguageKey {
    
    var uzb: String {
        switch self {
        case .ok: return "Ok"
        case .done: return "Bajarildi"
        case .cancel: return "Bekor qilish"
        case .select: return "Tanlash"
        case .titleLog : return "Api Log"
        }
    }
    
}
