//
//  UIView+Extensions.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit


extension UIView {
    
    convenience init(with options: [UIMetricOption]) {
        self.init()
        self.makeDefault()
        for option in options {
            self.set(option: option)
        }
    }
    
    convenience init(with options: UIMetricOption...) {
        self.init()
        self.makeDefault()
        for option in options {
            self.set(option: option)
        }
    }
    
    private func makeDefault() {
        self.backgroundColor = .clear
        self.frame = CGRect(x: .left20, y: .top5, width: .widthLeft20, height: .height40)
    }
    
    @objc func clearBackground() {
        self.backgroundColor = .clear
    }
    
    
    func addDivider(top: CGFloat, left: CGFloat = 0.0, color: UIColor = .colorDivider, height: CGFloat = 1.0){
        let view = UIView(frame: CGRect(x: left, y: top, width: self.frame.width - (2 * left), height: height))
        view.backgroundColor = color
        view.layer.cornerRadius = height/2
        self.addSubview(view)
    }
    
    func addDivider(rect: CGRect, color: UIColor = .colorDivider){
        let view = UIView(frame: rect)
        view.backgroundColor = color
        view.layer.cornerRadius = 0.5
        self.addSubview(view)
        
        
    }
    
    static func view(with options: [UIMetricOption]) -> UIView {
        return UIView(with: options)
    }
    
   private func set(option: UIMetricOption) {
        switch option {
        case .title(_): break
            
        case .frame(let cGRect):
            self.frame = cGRect
        case .textColor(_): break
            
        case .backgroundColor(let uIColor):
            self.backgroundColor = uIColor
        case .cornerRadius(let cGFloat):
            self.roundCorners(corners: .allCorners, radius: cGFloat)
        case .roundCorners(let uIRectCorner, let raduis):
            self.roundCorners(corners: uIRectCorner, radius: raduis ?? 5)
        case .image(_): break
            
        case .textAlignment(_): break
            
        case .contentMode(let contentMode):
            self.contentMode = contentMode
        case .font(_): break
        case .numberOfLines(_): break
        case .selector(_,_) : break
        case .metrics(let metrics):
            self.frame = CGRect(metrics)
        }
    }
    
}

extension UIView {
    func shakeAnimation() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }

    
    class func fromNib<T:UIView>() -> T {
        let nibName = String(describing: self)
        if let nib = Bundle.main.loadNibNamed(nibName, owner: self),
           let nibView = nib.first as? T {
            return nibView
        }
        
        return T()
        
    }
    

    
    func addBlurEffect()->Void{
        removeBlurEffect()
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
    }
    func removeBlurEffect() {
        let blurredEffectViews = self.subviews.filter{$0 is UIVisualEffectView}
        blurredEffectViews.forEach{ blurView in
            blurView.removeFromSuperview()
        }
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}


extension UITableViewCell {
    
    @objc override func clearBackground() {
        self.backgroundColor = .clear
        self.backgroundView?.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
    }
    
    func clearCell() {
        self.clearBackground()
        self.selectionStyle = .none
        
    }
    
}


extension UICollectionViewCell {
    
    @objc override func clearBackground() {
        self.backgroundColor = .clear
        self.backgroundView?.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
    }
    
}
