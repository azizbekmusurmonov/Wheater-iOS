//
//  LocationError.swift
//  Weather-iOS
//
//  Created by Azizbek Musurmonov   on 05/10/25.
//

import Foundation

enum LocationError: Error {
    case noLocationAvailable
    case noCityAvailable
    case noPlacemarkAvailable
}
