//
//  MObjectModel.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Foundation

protocol MObjectModel {
    var objectId: Int { get set }
}

extension Array where Element : MObjectModel {
    
    mutating func initObjects() {
        for i in 0 ..< self.count {
            self[i].objectId = (i + 1)
        }
    }
    
    func getItem(with id: Int) -> MObjectModel? {
        for item in self {
            if item.objectId == id {
                return item
            }
        }
        return nil
    }
    
    func indexOf(itemID: Int) -> Int {
        for i in 0 ..< self.count {
            if self[i].objectId == itemID {
                return i
            }
        }
        return 0
    }
    
    func indexOf(item: MObjectModel) -> Int {
        for i in 0 ..< self.count {
            if self[i].objectId == item.objectId {
                return i
            }
        }
        return 0
    }
}


struct MDataObjectModel:  Codable, MObjectModel {
   
    var objectId: Int

    var data: String?  // object, array
    var error: AErrorModel?
    var timeStamp: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case data = "data"
        case error = "error"
        case timeStamp = "timeStamp"

    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(String.self, forKey: .data)
        error = try values.decodeIfPresent(AErrorModel.self, forKey: .error)
        timeStamp = try values.decodeIfPresent(Int.self, forKey: .timeStamp)
        objectId = 0
    }
}
