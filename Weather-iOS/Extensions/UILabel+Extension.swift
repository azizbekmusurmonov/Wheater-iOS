//
//  UILabel+Extension.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

extension UIView {
    
    func label(_ frame: CGRect? = nil, _ title: String? = nil) -> UILabel {
        let label = UILabel(frame: frame ?? .zero)
        label.textColor = .colorTextMedium
        label.numberOfLines = 0
        label.font = .appFont(15, .FONT_MEDIUM)
        label.text = title
        return label
    }
    
    func label20(_ title: String? = nil) -> UILabel {

        let label = UILabel(frame: .label20FrameLeft20)
        label.textColor = .colorTextMedium
        label.numberOfLines = 0
        label.font = .appFont(15, .FONT_MEDIUM)
        label.text = title
        return label
    }
    
//    func label20Amount(_ amount: Int) -> UILabel {
//
//        let label = UILabel(frame: .label20FrameLeft20)
//        label.textColor = .colorTextMedium
//        label.numberOfLines = 0
//        label.font = .appFont(15, .FONT_MEDIUM)
//        label.text = amount.formatted()
//        return label
//    }
//
    func label16(_ title: String? = nil) -> UILabel {

        let label = UILabel(frame: .label20FrameLeft16)
        label.textColor = .colorTextMedium
        label.numberOfLines = 0
        label.font = .appFont(15, .FONT_MEDIUM)
        label.text = title
        return label
    }
    
    func label20(_ heigth: CGFloat = .height40, top: CGFloat = .top5) -> UILabel {

        let label = UILabel(frame: .rectLeft20(heigth, top: top))
        label.textColor = .colorTextMedium
        label.numberOfLines = 0
        label.font = .appFont(15, .FONT_MEDIUM)
        
        return label
    }
    
    func label20(_ heigth: CGFloat = .height40, top: CGFloat = .top5, title: String? = nil) -> UILabel {

        let label = UILabel(frame: .rectLeft20(heigth, top: top))
        label.textColor = .colorTextMedium
        label.numberOfLines = 0
        label.font = .appFont(15, .FONT_MEDIUM)
        label.text = title
        return label
    }
    
    func label16(_ heigth: CGFloat = .height40, top: CGFloat = .top5) -> UILabel {

        let label = UILabel(frame: .rectLeft16(heigth, top: top))
        label.textColor = .colorTextMedium
        label.numberOfLines = 0
        label.font = .appFont(15, .FONT_MEDIUM)
        
        return label
    }
    
    
    func labelDark(_ frame: CGRect? = nil) -> UILabel {
        let label = UILabel(frame: frame ?? .zero)
        label.textColor = .colorTextDark
        label.numberOfLines = 0
        label.font = .appFont(17, .FONT_BOLD)
        
        return label
    }
    
    func labelMedium(_ frame: CGRect? = nil) -> UILabel {
        let label = UILabel(frame: frame ?? .zero)
        label.textColor = .colorTextMedium
        label.numberOfLines = 0
        label.font = .appFont(16, .FONT_MEDIUM)
        
        return label
    }
    
    func labelCenter(_ frame: CGRect? = nil) -> UILabel {
        let label = UILabel(frame: frame ?? .zero)
        label.textColor = .colorTextMedium
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .appFont(19, .FONT_MEDIUM)
        
        return label
    }
    
    func labelCenter(title: String, _ frame: CGRect? = nil) -> UILabel {
        let label = UILabel(frame: frame ?? .zero)
        label.textColor = .colorTextMedium
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .appFont(19, .FONT_MEDIUM)
        label.text = title
        return label
    }
    
    func label20Bold(_ heigth: CGFloat = .height40, top: CGFloat = .top5, title: String? = nil) -> UILabel {

        let label = UILabel(frame: .rectLeft20(heigth, top: top))
        label.textColor = .colorTextMedium
        label.numberOfLines = 0
        label.font = .appFont(15, .FONT_BOLD)
        label.text = title
        return label
    }
    
    func addLabel(title: String? = nil, x: CGFloat = .left5, y : CGFloat = .top5) {
        let label = UILabel(frame: self.frame.frame(x, y: y))
        label.textColor = .colorTextMedium
        label.numberOfLines = 0
        label.font = .appFont(15, .FONT_MEDIUM)
        label.text = title
        self.addSubview(label)
    }
    
    func addLabel20(title: String? = nil, y : CGFloat = .top5, _ height: CGFloat? = nil) {
        let label = UILabel(frame: self.frame.frame20(y, height))
        label.textColor = .colorTextMedium
        label.numberOfLines = 0
        label.font = .appFont(15, .FONT_MEDIUM)
        label.text = title
        self.addSubview(label)
    }

}

extension UILabel {
    
    convenience init(_ options: [UIMetricOption]) {
        self.init()
        self.makeDefault()
        for option in options {
            self.set(option: option)
        }
    }
    
    convenience init(_ options: UIMetricOption...) {
        self.init()
        self.makeDefault()
        for option in options {
            self.set(option: option)
        }
    }
    
    static func label(with options: [UIMetricOption]) -> UIView {
        return UILabel(with: options)
    }
    
    private func set(option: UIMetricOption) {
        switch option {
        case .title(let title):
            self.text = title
        case .frame(let cGRect):
            self.frame = cGRect
        case .textColor(let color):
            self.textColor = color
        case .backgroundColor(let uIColor):
            self.backgroundColor = uIColor
        case .cornerRadius(let cGFloat):
            self.roundCorners(corners: .allCorners, radius: cGFloat)
        case .roundCorners(let uIRectCorner, let raduis):
            self.roundCorners(corners: uIRectCorner, radius: raduis ?? 5)
        case .image(_): break
            
        case .textAlignment(let metric): 
            self.textAlignment = metric
        case .contentMode(let contentMode):
            self.contentMode = contentMode
        case .font(let font):
            self.font = font
        case .numberOfLines(let lines):
            self.numberOfLines = lines
        case .selector(_,_) : break
        case .metrics(let metrics):
            self.frame = CGRect(metrics)
        }
    }
    
    private func makeDefault() {
        self.backgroundColor = .clear
        self.textColor = .colorTextMedium
        self.font = .appFont(16, .FONT_MEDIUM)
        self.numberOfLines = 0
        self.textAlignment = .left
        self.frame = CGRect(x: .left20, y: .top5, width: .widthLeft20, height: .height20)
    }
    
}
