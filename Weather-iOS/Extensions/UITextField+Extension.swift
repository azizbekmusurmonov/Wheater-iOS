//
//  UITextField+Extension.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit


extension UITextField {
    
    public var placeHolderColor: UIColor {
        set(color) {
            let text = self.placeholder ?? "type ..."
            self.attributedPlaceholder =
            NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: color])
        }
        get {
            return self.textColor ?? .gray
        }
    }
    
    public var placeHolder: (String?, UIColor) {
        set(objc) {
            let text = objc.0 ?? "type ..."
            self.attributedPlaceholder =
            NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: objc.1])
        }
        get {
            return (nil, self.textColor ?? .gray)
        }
    }
    
}
