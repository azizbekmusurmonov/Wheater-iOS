//
//  HomeViewModel.swift
//  Weather-iOS
//
//  Created by Azizbek Musurmonov   on 02/10/25.
//

import UIKit

class HomeViewModel {
    
    private var delegate: HomeViewProtocol?
    
    init(_ delegate: HomeViewProtocol) {
        self.delegate = delegate
    }
    
    
}
