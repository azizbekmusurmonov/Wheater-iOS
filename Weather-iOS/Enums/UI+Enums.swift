//
//  UI+Enums.swift
//  Weather-iOS
//
//  Created by Azizbek Musurmonov   on 02/10/25.
//

import UIKit


public enum ApplicationThemeMode : Int {
    
    case light = 200
    case dark
    
}

public enum GradientStyles : Int {
    case topToBottom = 100
    case leftToRight
    case leftTopToBottomRight
    case leftBottomToTopRight
}


enum HeaderAction: Int {
    case back = 100
    case share
    case search
    case edit
    case home
    case save
    case backW
    case list
    case clear
    case setting
    case readAll
    case delete
    
    var imageKey: UIIMageEnum {
        switch self {
        case .back: return .lMenuCart
        case .share: return .lMenuCart
        case .search: return .lMenuCart
        case .edit: return .lMenuCart
        case .home: return .lMenuCart
        case .save: return .lMenuCart
        case .backW: return .lMenuCart
        case .list: return .lMenuCart
        case .clear: return .lMenuCart
        case .setting: return .lMenuCart
        case .readAll: return .lMenuCart
        case .delete: return .lMenuCart
        }
    }
}
