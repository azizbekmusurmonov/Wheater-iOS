//
//  Image+Light.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

extension UIIMageEnum {
    
    var light: UIImage {
        switch self  {
            
        case .lMenuHome:  return UIImage(named: "mdi_HouseLine")?.withRenderingMode(.alwaysOriginal) ?? #imageLiteral(resourceName: "mdi_HouseLine")
        case .lMenuCatalog:  return UIImage(named: "mdi_format-list-bulleted")?.withRenderingMode(.alwaysOriginal) ?? #imageLiteral(resourceName: "mdi_format-list-bulleted")
        case .lMenuCart:  return UIImage(named: "Frame 4620")?.withRenderingMode(.alwaysOriginal) ?? #imageLiteral(resourceName: "Frame 4620")
        case .lMenuLiked:  return UIImage(named: "Heart")?.withRenderingMode(.alwaysOriginal) ?? #imageLiteral(resourceName: "Heart")
        case .lMenuMore:  return UIImage(named: "morder")?.withRenderingMode(.alwaysOriginal) ?? #imageLiteral(resourceName: "morder")
        case .lMenuHomeSelect:  return UIImage(named: "mdi_HouseLine-1")?.withRenderingMode(.alwaysOriginal) ?? #imageLiteral(resourceName: "mdi_HouseLine-1")
        case .lMenuCatalogSelect:  return UIImage(named: "mdi_format-list-bulleted-1")?.withRenderingMode(.alwaysOriginal) ?? #imageLiteral(resourceName: "mdi_format-list-bulleted-1")
        case .lMenuCartSelect:  return UIImage(named: "Frame 4621")?.withRenderingMode(.alwaysOriginal) ?? #imageLiteral(resourceName: "Frame 4621")
        case .lMenuLikedSelect:  return UIImage(named: "Heart-1")?.withRenderingMode(.alwaysOriginal) ?? #imageLiteral(resourceName: "Heart-1")
        case .lMenuMoreSelect:  return UIImage(named: "morderselect")?.withRenderingMode(.alwaysOriginal) ?? #imageLiteral(resourceName: "morderselect")
        }
    }
    
}
