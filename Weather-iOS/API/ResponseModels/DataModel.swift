//
//  APIClient.swift
//  Weather-iOS
//
//  Created by Azizbek Musurmonov   on 02/10/25.
//

import Foundation

struct ADataModel<T:Codable>: Codable {
    
    var data: T?  // object, array
    var error: AErrorModel?
    var timeStamp: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case data = "data"
        case error = "error"
        case timeStamp = "timeStamp"

    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(T.self, forKey: .data)
        error = try values.decodeIfPresent(AErrorModel.self, forKey: .error)
        timeStamp = try values.decodeIfPresent(Int.self, forKey: .timeStamp)
    }
}
