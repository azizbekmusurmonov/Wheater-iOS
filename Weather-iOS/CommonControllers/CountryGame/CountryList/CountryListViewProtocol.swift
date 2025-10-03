//
//  CountryListViewProtocol.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//

import Foundation


protocol CountryListViewProtocol {
    
    func reloadData() 
    
    func reload(section: [Int])
    
    func reload(indexPath: [IndexPath])
    
    func showLoader(_ show: Bool) 
}
