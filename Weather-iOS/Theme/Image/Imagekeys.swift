//
//  Imagekeys.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

enum UIIMageEnum {
    
    case lMenuHome
    case lMenuCatalog
    case lMenuCart
    case lMenuLiked
    case lMenuMore
    case lMenuHomeSelect
    case lMenuCatalogSelect
    case lMenuCartSelect
    case lMenuLikedSelect
    case lMenuMoreSelect
    
}

extension UIIMageEnum {
    
    var image: UIImage {
        return  SharedManager.isLightMode() ? self.light : self.dark
    }
    
}

extension UIImage {
    
    func getImage(_ imageEnum: UIIMageEnum) -> UIImage {
        return  SharedManager.isLightMode() ? imageEnum.light : imageEnum.dark
    }
    
}

extension UIButton {
    
    func set(_ image: UIIMageEnum) {
        self.setImage(image.image, for: .normal)
    }
    
    func set(_ section: HeaderAction) {
        self.set(section.imageKey)
    }
}

extension UIImageView {
    func set(_ image: UIIMageEnum) {
        self.image = image.image
    }
}

extension UITabBarItem {
    
    func set(_ image: UIIMageEnum) {
        self.image = image.image
    }
}
