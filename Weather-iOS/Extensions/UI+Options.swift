//
//  UI+Options.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

struct UILabelOptions {
    
    var frame: CGRect
    var title: String?
    var titleColor: UIColor?
    var textAlignment: NSTextAlignment = .left
    var font: UIFont = .appFont(16,.FONT_MEDIUM)
    var numberOfLines = 0
    
    init(title: String? = nil) {
        self.frame = CGRect(x: .left5, y: .top5, width: windowWidth - (2 * .left5), height: .height20)
        self.title = title
        self.titleColor = .colorTextMedium
        self.textAlignment = .left
        self.font = .appFont(16,.FONT_MEDIUM)
        self.numberOfLines = 0
    }
    
    init(frame: CGRect, title: String? = nil, titleColor: UIColor = .colorTextMedium, textAlignment: NSTextAlignment = .left, font: UIFont = .appFont(16,.FONT_MEDIUM), numberOfLines: Int = 0) {
        self.frame = frame
        self.title = title
        self.titleColor = titleColor
        self.textAlignment = textAlignment
        self.font = font
        self.numberOfLines = numberOfLines
    }
    
    init(x: CGFloat = .left5, y: CGFloat = .top5, height: CGFloat = .height20, title: String? = nil, titleColor: UIColor? = nil, textAlignment: NSTextAlignment, font: UIFont, numberOfLines: Int = 0) {
        self.frame = CGRect(x: x, y: y, width: windowWidth - (2 * x), height: height)
        self.title = title
        self.titleColor = titleColor
        self.textAlignment = textAlignment
        self.font = font
        self.numberOfLines = numberOfLines
        
    }
    

}

enum UIMetricOption {
    
    case title(String?)
    case frame(CGRect)
    case metrics([UIFrameOption])
    case textColor(UIColor)
    case font(UIFont)
    case backgroundColor(UIColor)
    case cornerRadius(CGFloat)
    case roundCorners(UIRectCorner, CGFloat? = 5)
    case textAlignment(NSTextAlignment)
    case contentMode(UIView.ContentMode)
    case numberOfLines(Int)
    
    case image(UIImage)
    case selector(Selector,Any?)
    
    
}

enum UIFrameOption {
    case x(CGFloat)
    case y(CGFloat)
    case width(CGFloat)
    case height(CGFloat)
}


