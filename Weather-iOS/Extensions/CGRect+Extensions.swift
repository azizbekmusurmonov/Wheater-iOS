//
//  CGRect+Extensions.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit


extension CGRect {
    
    init(_ options: [UIFrameOption]) {
        var x: CGFloat = .left5
        var y: CGFloat = .top5
        var w: CGFloat = 0
        var h: CGFloat = .height20
        for option in options {
            switch option {
            case .x(let cGFloat): x = cGFloat
            case .y(let cGFloat): y = cGFloat
            case .width(let cGFloat): w = cGFloat
            case .height(let cGFloat): h = cGFloat
            }
        }
        if w <= 0 {
            w = windowWidth - (2 * x)
        }
        self.init(x: x, y: y, width: w, height: h)
    }
    
    init(_ options: UIFrameOption...) {
        var x: CGFloat = .left5
        var y: CGFloat = .top5
        var w: CGFloat = 0
        var h: CGFloat = .height20
        for option in options {
            switch option {
            case .x(let cGFloat): x = cGFloat
            case .y(let cGFloat): y = cGFloat
            case .width(let cGFloat): w = cGFloat
            case .height(let cGFloat): h = cGFloat
            }
        }
        if w <= 0 {
            w = windowWidth - (2 * x)
        }
        self.init(x: x, y: y, width: w, height: h)
    }
  
    static func frame(with options: [UIFrameOption]) -> CGRect {
        return CGRect(options)
    }
    
    static func rectLeft20(_ height: CGFloat = .height40, top: CGFloat = .top5) -> CGRect {
        return CGRect(x: .left20, y: top, width: .widthLeft20, height: height)
    }
    
    static func rectLeft16(_ height: CGFloat = .height40, top: CGFloat = .top5) -> CGRect {
        return CGRect(x: .left16, y: top, width: .widthLeft16, height: height)
    }
    
    // returns a frame to draw inside current frame with given x and y positions
    func frame(_ x: CGFloat = .left5, y: CGFloat = .top5, _ height: CGFloat? = nil) -> CGRect {
        return CGRect(x: x, y: y, width: self.width - (2 * x), height: height ?? (self.height - (2 * y)))
    }
    
    func frame16(_ top: CGFloat = .top5, _ height: CGFloat? = nil) -> CGRect {
        return CGRect(x: .left16, y: top, width: self.width - 32, height: height ?? (self.height - (2 * top)))
    }
    
    func frame20(_ top: CGFloat = .top5, _ height: CGFloat? = nil) -> CGRect {
        return CGRect(x: .left20, y: top, width: self.width - 40, height: height ?? (self.height - (2 * top)))
    }
    
    static let frameLeft20: CGRect = CGRect(x: .left20, y: .top5, width: .widthLeft20, height: .height30)
    
    static let frameLeft16: CGRect = CGRect(x: .left16, y: .top5, width: .widthLeft16, height: .height30)
    
    static let label20FrameLeft16: CGRect = CGRect(x: .left16, y: .top5, width: .widthLeft16, height: .height20)
    
    static let label20FrameLeft20: CGRect = CGRect(x: .left20, y: .top5, width: .widthLeft20, height: .height20)
    
    
    
}
