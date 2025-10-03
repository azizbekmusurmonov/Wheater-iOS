//
//  UIColor+Extensions.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

extension UIColor {
    
    
    public static func getColor(from hex: String,_ withAlpha: Bool = true) -> UIColor {
        let r, g, b : CGFloat
        var a : CGFloat = 1.0
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = (CGFloat(hexNumber & 0x000000ff) / 255)
                    a = (a < 1) ? a : 0.55
                    return UIColor(red: r, green: g, blue: b, alpha: withAlpha ? a : 1)
                }
            } else
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat((hexNumber & 0x0000ff)) / 255
                    a = 1.0
                    
                    return UIColor(red: r, green: g, blue: b, alpha: withAlpha ? a : 1)
                }
            }
        }
        return .black
    }
    
    public static func get(from hex: String,_ withAlpha: Bool = true) -> UIColor? {
        let r, g, b : CGFloat
        var a : CGFloat = 1.0
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = (CGFloat(hexNumber & 0x000000ff) / 255)
                    a = (a < 1) ? a : 0.55
                    return UIColor(red: r, green: g, blue: b, alpha: withAlpha ? a : 1)
                }
            } else
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat((hexNumber & 0x0000ff)) / 255
                    a = 1.0
                    
                    return UIColor(red: r, green: g, blue: b, alpha: withAlpha ? a : 1)
                }
            }
        }
        return nil
    }
    
    public static func makeGradientColorForSiri(_ b: UIColor,_ e: UIColor, _ style: GradientStyles = .leftToRight) -> CAGradientLayer{
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [b.cgColor, e.cgColor]
        gradientLayer.shouldRasterize = true
        switch style {
        case .leftToRight :
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
            break
            
        case .topToBottom :
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
            break
            
        case .leftTopToBottomRight :
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
            break
            
        case .leftBottomToTopRight :
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
            break
        }
        
        return gradientLayer
    }
    
}
