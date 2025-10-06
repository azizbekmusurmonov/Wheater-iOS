//
//  HomeViewProtocol.swift
//  Weather-iOS
//
//  Created by Azizbek Musurmonov   on 04/10/25.
//

import Foundation

protocol HomeViewProtocol {
    
    func reloadData()
    
    func reload(section: [Int])
    
    func reload(indexPath: [IndexPath])
    
    func showLoader(_ show: Bool)
}
