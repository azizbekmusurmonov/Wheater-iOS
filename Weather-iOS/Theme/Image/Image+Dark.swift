//
//  Image+Dark.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit


extension UIIMageEnum {
    
    var dark: UIImage {
        switch self  {
            
        case .lMenuHome:  return UIImage(named: "mdi_HouseLine-3")?.withRenderingMode(.alwaysOriginal) ?? #imageLiteral(resourceName: "mdi_HouseLine-3")
        case .lMenuCatalog:  return UIImage(named: "mdi_format-list-bulleted-3")?.withRenderingMode(.alwaysOriginal) ?? #imageLiteral(resourceName: "mdi_format-list-bulleted-3")
        case .lMenuCart:  return UIImage(named: "Frame 4622")?.withRenderingMode(.alwaysOriginal) ?? #imageLiteral(resourceName: "Frame 4622")
        case .lMenuLiked:  return UIImage(named: "Heart-3")?.withRenderingMode(.alwaysOriginal) ?? #imageLiteral(resourceName: "Heart-3")
        case .lMenuMore:  return UIImage(named: "My orders")?.withRenderingMode(.alwaysOriginal) ?? #imageLiteral(resourceName: "My orders")
        case .lMenuHomeSelect:  return UIImage(named: "mdi_HouseLine-2")?.withRenderingMode(.alwaysOriginal) ?? #imageLiteral(resourceName: "mdi_HouseLine-2")
        case .lMenuCatalogSelect:  return UIImage(named: "mdi_format-list-bulleted-2")?.withRenderingMode(.alwaysOriginal) ?? #imageLiteral(resourceName: "mdi_format-list-bulleted-2")
        case .lMenuCartSelect:  return UIImage(named: "Frame 4623")?.withRenderingMode(.alwaysOriginal) ?? #imageLiteral(resourceName: "Frame 4623")
        case .lMenuLikedSelect:  return UIImage(named: "Heart-2")?.withRenderingMode(.alwaysOriginal) ?? #imageLiteral(resourceName: "Heart-2")
        case .lMenuMoreSelect:  return UIImage(named: "My orders-1")?.withRenderingMode(.alwaysOriginal) ?? #imageLiteral(resourceName: "My orders-1")
            
        
      
        }
    }
    
}

