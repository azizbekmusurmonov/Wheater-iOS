//
//  UI+Metrics.swift
//  Weather-iOS
//
//  Created by Azizbek Musurmonov   on 02/10/25.
//

import UIKit

public let windowHeight = UIScreen.main.bounds.height
public let windowWidth =  UIScreen.main.bounds.width
public var windowStatusBarHeight =  UIApplication.shared.statusBarFrame.height
public var windowNavigationHeight: CGFloat = 44
public let windowFixedHeight = windowHeight - windowStatusBarHeight - windowNavigationHeight
public let windowFixedHeightForIntreview = windowHeight - windowStatusBarHeight
public let isXModel: Bool = (windowWidth >= 375 && windowHeight >= 812)
public var windowTabBarHeight:CGFloat = isXModel ? 83 : 44
public let windowFixedHeightForHome = windowHeight - windowStatusBarHeight - windowTabBarHeight

public func universalHeight(_ height: CGFloat) -> CGFloat {
    return height / 812 * windowHeight
}

public func universalWidth(_ width: CGFloat) -> CGFloat {
    return width / 375 * windowWidth
}
