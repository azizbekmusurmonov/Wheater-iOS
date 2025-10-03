//
//  ResponseHandleextensions.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit
import Alamofire

extension ApiClient {
    
    static func handleSHARE(_ response: SharedResponse) {
        SharedManager.addResponse(response)
    }
    
}


extension URLRequest {
    func prettyString() -> String {
        var result = "\(self.method?.rawValue ?? "") : " + (self.url?.path ?? "").addLine()
        result += "FULL URL : \(self.url?.absoluteString ?? "")".addLine()
        for item in self.headers {
            let header = "\(item.name) : \(item.value)"
            result.append(header.addLine())
        }
        if let body = self.httpBody, let str = String(data: body, encoding: .utf8) {
            let boddy = "\n PARAMTERES : \(str)"
            result.append(boddy.addLine())
        }
        return result
    }
}

extension HTTPURLResponse {
    func prettyString() -> String {
        return "\(self.statusCode)"
    }
}

extension AFDataResponse {
    func prettyString() -> String {
        var result = self.request?.prettyString().addLine() ?? ""
        result.append(self.response?.prettyString() ?? "")
        if let body = self.data, let str = String(data: body, encoding: .utf8) {
            result.append(str.addLine())
        }
        return result
    }
    
    func sharedResponse() -> SharedResponse {
        let header = self.request?.prettyString() ?? ""
        let status = self.response?.statusCode ?? 0
        var param = ""
        if let body = self.data, let str = String(data: body, encoding: .utf8) {
            param = str
        }
        let operTime = Double(self.metrics?.taskInterval.duration ?? 0.0)
        let date = self.metrics?.taskInterval.start ?? Date()
        let shRes = SharedResponse(time: date.printFull(), data: param, statusCode: status, headers: header, operationTime: operTime)
        return shRes
    }
}

extension String {
    mutating func endLine() {
        self = self + " \n "
    }
    
    func addLine() -> String {
        return (self + " \n ")
    }
}

struct SharedResponse : Codable {
    var time: String
    var data: String
    var statusCode: Int
    var headers: String
    var operationTime: Double
    
    var formattedData : String {
        var result = "\(headers)\n"
        result += "OPERATION TIME : \(operationTime)\n\n"
        result += "SATUTS CODE : \(statusCode)\n\n"
        result += "RESPONSE : \(data)\n\n"
        result += "CALLED : \(time)\n"
        return result
    }
    
    var shareString : String {
        var result = "\(headers)\n"
        result += "OPERATION TIME : \(operationTime)\n"
        result += "SATUTS CODE : \(statusCode)\n"
        result += "RESPONSE : \(data)\n"
        result += "CALLED : \(time)\n"
        return result
    }
}

extension UITableViewCell {
    
    func clearBackGround() {
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        self.backgroundView?.backgroundColor = .clear
    }
    
    func clearAllBackground() {
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        self.backgroundView?.backgroundColor = .clear
        self.selectionStyle = .none
    }
}
