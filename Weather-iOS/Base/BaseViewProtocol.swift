//
//  BaseViewProtocol.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Foundation

@objc protocol BaseViewProtocol {

    func loader(_ show: Bool)
    
    @objc optional func reloadData()
}
