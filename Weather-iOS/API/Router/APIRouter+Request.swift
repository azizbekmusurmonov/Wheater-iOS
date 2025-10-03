//
//  APIRouter+Request.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Foundation
import Alamofire

extension ApiRouter : URLRequestConvertible {
    
    
    func asURLRequest() throws -> URLRequest {
        
        var urlRequest = URLRequest(url: try path.asURL())
        urlRequest.httpMethod = method.rawValue
        
        //MARK: - Querries
        if queries != nil {
            urlRequest = try URLEncoding.queryString.encode(urlRequest, with: queries)
        }
        
        //MARK: - Headers (DEFAULT)
        urlRequest.addDefaultHeaders()
        
        //MARK: - Headers
        if let headers = headers {
            for item in headers {
                urlRequest.setValue(item.value, forHTTPHeaderField: item.name)
            }
        }
        
        //MARK: - Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error ))
            }
        }
        
        //MARK: - Array Parameters
        if let parameters = arrayParameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error ))
            }
        }
        
        
        return urlRequest
    }
    
    
}

extension URLRequest {
    
    mutating func addDefaultHeaders() {
        self.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        self.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        self.setValue("iOS", forHTTPHeaderField: HTTPHeaderField.deviceOS.rawValue)
        self.setValue((Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? ContentType.api_version.rawValue, forHTTPHeaderField: HTTPHeaderField.apiVersion.rawValue)
        
    }
    
}

struct APIParameterKey {
    
    static let merchantVersion = "merchantVersion"
    static let phoneNumber = "phoneNumber"
    static let username = "username"
    static let cardNumber = "cardNumber"
    static let cardID = "cardId"
    static let latitude = "lat"
    static let longitude = "lon"
    static let contains = "contains"
    static let count = "count"
    static let page = "page"
    static let from = "from"
    static let to = "to"
    static let tripId = "tripId"
    static let id = "id"
    static let atPlaces = "atPlaces"
    static let category = "category"
    static let merchantId = "merchantId"
    static let savedPaymentId = "savedPaymentId"
}

enum HTTPHeaderField: String {
    // case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case apiVersion = "appVersion"
    case deviceOS = "typeOS"
    case deviceOs = "typeOs"
    case language = "Language"
    case gender = "gender"
    case access_token = "Authorization"
    case deviceId = "fingerprint"
    case deviceName = "deviceName"
    case ip = "ip"
    case signature = "signature"
    case token = "Token"
    
}

enum ContentType: String {
    case json = "application/json"
    case deviceOS = "IOS"
    case api_version = "1.0.1"
}


