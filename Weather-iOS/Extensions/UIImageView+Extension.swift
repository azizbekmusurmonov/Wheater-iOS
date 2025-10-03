//
//  UIImageView+Extension.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

extension UIImageView {
    
    
    func image24(_ img: UIIMageEnum = .lMenuCart) -> UIImageView {
        let image = UIImageView(frame: CGRect(x: .left5, y: .top5, width: 24, height: 24))
        image.set(img)
        image.clearBackground()
        return image
    }
    
    func imageRound24(_ img: UIIMageEnum = .lMenuCart) -> UIImageView {
        let image = UIImageView(frame: CGRect(x: .left5, y: .top5, width: .height24, height: .height24))
        image.set(img)
        image.layer.cornerRadius = .height24.cornerRadius
        image.clearBackground()
        return image
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
        case .frame(let cGRect):
            self.frame = cGRect

        case .backgroundColor(let uIColor):
            self.backgroundColor = uIColor
        case .cornerRadius(let cGFloat):
            self.roundCorners(corners: .allCorners, radius: cGFloat)
        case .roundCorners(let uIRectCorner, let raduis):
            self.roundCorners(corners: uIRectCorner, radius: raduis ?? 5)
        case .image(let img):
            self.image = img
       
        case .contentMode(let contentMode):
            self.contentMode = contentMode
       
        case .metrics(let metrics):
            self.frame = CGRect(metrics)
            
        default : break
        }
    }
    
    private func makeDefault() {
        self.backgroundColor = .clear
        self.frame = CGRect(x: .left20, y: .top5, width: .widthLeft20, height: .height20)
        self.contentMode = .scaleAspectFit
    }
}
