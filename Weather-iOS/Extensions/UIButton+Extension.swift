//
//  UIButton+Extension.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit


extension UIButton {
    
    func button(_ frame: CGRect? = nil) -> UIButton {
        let button = UIButton(frame: frame ?? .zero)
        button.layer.cornerRadius = 6
        button.backgroundColor = .colorMain
        button.setText(.select)
        button.set(.lMenuCart)
        button.titleLabel?.font = .appFont(18, .FONT_BLACK)
        return button
    }
    
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
    
    private func set(option: UIMetricOption) {
        switch option {
        case .title(let title):
            self.setTitle(title, for: .normal)
        case .frame(let cGRect):
            self.frame = cGRect
        case .textColor(let color):
            self.setTitleColor(color, for: .normal)
        case .backgroundColor(let uIColor):
            self.backgroundColor = uIColor
        case .cornerRadius(let cGFloat):
            self.roundCorners(corners: .allCorners, radius: cGFloat)
        case .roundCorners(let uIRectCorner, let raduis):
            self.roundCorners(corners: uIRectCorner, radius: raduis ?? 5)
        case .image(let img): 
            self.setImage(img, for: .normal)
        case .textAlignment(let metric):
            self.titleLabel?.textAlignment = metric
        case .contentMode(let contentMode):
            self.contentMode = contentMode
        case .font(let font):
            self.titleLabel?.font = font
        case .numberOfLines(let lines):
            self.titleLabel?.numberOfLines = lines
        case .selector(let selector, let target) : 
            self.addTarget(target ?? self, action: selector, for: .touchUpInside)
        case .metrics(let metrics):
            self.frame = CGRect(metrics)
        }
    }
    
    private func makeDefault() {
        self.backgroundColor = .clear
        self.titleLabel?.textColor = .colorTextMedium
        self.titleLabel?.font = .appFont(16, .FONT_MEDIUM)
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.textAlignment = .left
        self.frame = CGRect(x: .left20, y: .top5, width: .widthLeft20, height: .height20)
        
        
    }
    
}

extension UIView {
    
    func addButton(with options: [UIMetricOption], selector: Selector? = nil, _ target: Any? = nil) {
        let button = UIButton(options)
        if let sel = selector {
            button.addTarget(target ?? self, action: sel, for: .touchUpInside)
        }
        self.addSubview(button)
    }
    
    func addButton(_ options: UIMetricOption...) {
        self.addSubview(UIButton(options))
    }
    
    func createButton(_ options: UIMetricOption...) -> UIButton {
        let button = UIButton(options)
        self.addSubview(button)
        return button
    }
    
    func addLabel(_ options: UIMetricOption...) {
        self.addSubview(UILabel(options))
    }
    
    func createLabel(_ options: UIMetricOption...) -> UILabel {
        let label = UILabel(options)
        self.addSubview(label)
        return label
    }
    
}


