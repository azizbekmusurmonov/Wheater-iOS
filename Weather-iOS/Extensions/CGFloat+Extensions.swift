//
//  CGFloat+Extensions.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit


extension CGFloat {
    
    static let windowWidth: CGFloat = windowWidth
    static let windowHeigth: CGFloat = windowHeight
    static let widthLeft20: CGFloat = (windowWidth - 40)
    static let widthLeft16: CGFloat = (windowWidth - 32)
    static let widthHalfLeft20: CGFloat = (windowWidth - 40)/2
    static let widthHalfLeft16: CGFloat = (windowWidth - 32)/2
    
    static let top5: CGFloat = 5
    static let top10: CGFloat = 10
    static let top15: CGFloat = 15
    static let top16: CGFloat = 15
    static let top20: CGFloat = 20
    
    static let left5: CGFloat = 5
    static let left10: CGFloat = 10
    static let left15: CGFloat = 15
    static let left16: CGFloat = 15
    static let left20: CGFloat = 20
    
    static let height20: CGFloat = 20
    static let height24: CGFloat = 24
    static let height30: CGFloat = 30
    static let height32: CGFloat = 32
    static let height35: CGFloat = 35
    static let height38: CGFloat = 38
    static let height40: CGFloat = 40
    static let height45: CGFloat = 45
    static let height50: CGFloat = 50
    static let height60: CGFloat = 60
    
    //Doston
    
    
    
    var cornerRadius: CGFloat {
        return self/2
    }
    
    var half: CGFloat {
        return self/2
    }
}
