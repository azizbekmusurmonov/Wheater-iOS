//
//  LanguageKeyManager.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

enum LanguageEnum :Int {
    case uzbek = 100
    case english
    case russian
}

extension LanguageKey {
    
    var text : String {
        switch SharedManager.getLanguage() {
        
        case .uzbek: return self.uzb
        case .english: return self.eng
        case .russian: return self.rus
        }
    }
    
}

extension UILabel {
    
    func set(_ key: LanguageKey) {
        self.text = key.text
    }
    
}

extension UIButton {
    
    func set(_ key: LanguageKey) {
        self.setTitle(key.text, for: .normal)
    }
    
    func setText(_ key: LanguageKey) {
        self.setTitle(key.text, for: .normal)
    }
    
}


