//
//  UIVC+Alert.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit


extension UIViewController {
    
    func alert() -> UIAlertController {
        
        let alert = UIAlertController(title: LanguageKey.ok.text, message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: LanguageKey.cancel.text, style: .destructive)
        
        alert.addAction(action)
        
        return alert
        
    }
    
    
    func alert(title: String) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: LanguageKey.cancel.text, style: .destructive)
        
        alert.addAction(action)
        
        return alert
        
    }
    
    func alert(title: String, actions: [UserActionType], completion: ((UserActionType) -> Void?)) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        
     
        
        for action in actions {
            let action = UIAlertAction(title: action.title, style: .destructive)
            
            alert.addAction(action)
        }
        
        return alert
        
    }
    
}


enum UserActionType  {
    
    case cancel
    case ok
    case accept
    case go
    case delete
    case done
    
    
    var title: String {
        
        return ""
    }
    
}
