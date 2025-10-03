//
//  APIClient.swift
//  Weather-iOS
//
//  Created by Azizbek Musurmonov   on 02/10/25.
//

import Foundation

struct AErrorModel: Codable {
    let name: String?
    let code: Int?
    let message : String?
    var statusCode : Int?
    var type: APIErrorType = .other
    
    var readableError: String {
        var msg = self.message ?? ""

        if msg.removeWhiteSpaces().count <= 0 {
            msg = "error"
        }
        return msg
    }
    
    enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case code = "code"
        case message = "message"
        case statusCode = "status"

    }
    
    init(code: Int, _ mes: String?) {
        self.code = code
        self.statusCode = code
        self.name = nil
        self.message = mes
        self.initErorType()
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        statusCode = try values.decodeIfPresent(Int.self, forKey: .statusCode)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        self.initErorType()
    }
    
    mutating func initErorType() {
        if let code = self.statusCode {
            
            switch code {
            case 401 : self.type = .goLogin
                break
                
            case 403 : self.type = .needUpdate
                break
                
            case 410 : self.type = .needUpdate
                break
                
            case 101 : self.type = .goLogin
                break
                
            case 422 : self.type = .error
                break
                
            case 2,1 :
                self.statusCode = nil
                self.type = .null
                
            default : self.type = .other
            }
            
        } else {
            self.type = .null
        }
    }
    
    func isNull() -> Bool {
        return (self.statusCode != nil)
    }
    
}

enum APIErrorType {
    case goLogin
    case needUpdate
    case userNotFound
    case error
    case other
    case null
}
