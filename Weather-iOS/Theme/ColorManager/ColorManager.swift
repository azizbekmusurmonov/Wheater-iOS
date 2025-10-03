//
//  ColorManager.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

struct ColorManager {
    
    static let shared : ColorManager = ColorManager()
    
    func initForDefaultTheme() {
        UIColor.initForLight()
    }
    
    func initForSetting() {
        switch SharedManager.getApplicationTheme() {
        case .dark : UIColor.initForDark()
        case .light : UIColor.initForLight()
        }
    }
    
    func initFor(mode theme: ApplicationThemeMode){
        SharedManager.setApplicationTheme(theme)
        self.initForSetting()
    }
    
    func initThemeByBrightness() {
        switch UIScreen.main.brightness {
        case 0 ... APPLICATION_DARK_MODE_FINAL_VALUE:
            SharedManager.setApplicationTheme(.light)
            self.initForSetting()
        default:
            SharedManager.setApplicationTheme(.dark)
            self.initForSetting()
        }
    }

}

