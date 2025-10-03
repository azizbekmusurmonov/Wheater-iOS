//
//  APIClient.swift
//  Weather-iOS
//
//  Created by Azizbek Musurmonov   on 02/10/25.
//

import Foundation
import Alamofire


extension ApiClient {
    
    static func handleError(error: AErrorModel) {
        switch error.type {
        case .userNotFound :

            appDelegate.route(to: .main)
            break
        case .goLogin :
            
            appDelegate.route(to: .spalshScreen)
            
            break
            
        case .needUpdate :
            appDelegate.route(to: .needUpdate)
            break
            
        case .null :

            
            break
        case .other, .error :

            
            break
        }
    }
    
    static func handleData<T:Codable>(data :AFDataResponse<ADataModel<T>>, completion:@escaping (T?)->Void) {
        let result = data.result
        
        switch result {
        case .success(let resData) :
            
            completion(resData.data)
            if let error = resData.error {
                self.handleError(error: error)
            }
        case .failure(let error) :
            completion(nil)
            if let code = error.responseCode {
                self.handleError(error: AErrorModel(code: code, error.failureReason))
            }
            
        }
    }
    
    static func handleData<T:Codable>(data :AFDataResponse<Data>, completion:@escaping (T?)->Void) {
        let result = data.result
        
        switch result {
        case .success(let resData) :
            
            do {
                let decoder: JSONDecoder = JSONDecoder()
                let dataModel = try decoder.decode(ADataModel<T>.self, from: resData)
                completion(dataModel.data)
                
                if let error = dataModel.error {
                    self.handleError(error: error)
                }
                
            } catch {
                print(error)
                completion(nil)
            }
            
        case .failure(let error) :
            completion(nil)
            if let code = error.responseCode {
                self.handleError(error: AErrorModel(code: code, error.failureReason))
            }
            
        }
    }
    
    static func handleData<T:Codable>(data :AFDataResponse<String>, completion:@escaping (T?)->Void) {
        let result = data.result
        
        switch result {
        case .success(let resData) :
            if let data = resData.replacingOccurrences(of: "\n", with: "\\n").data(using: String.Encoding.utf8) {
                print(resData.replacingOccurrences(of: "\n", with: "\\n"))
                do {
                    let decoder: JSONDecoder = JSONDecoder()
                    let model = try decoder.decode(ADataModel<T>.self, from: data)
                    if let error = model.error {
                        self.handleError(error: error)
                    }
                    completion(model.data)
                 
                } catch {
                    NSLog("ERROR \(String(error.localizedDescription))")
                    completion(nil)
                }
            
            }
        case .failure(let error) :
            completion(nil)
            if let code = error.responseCode {
                self.handleError(error: AErrorModel(code: code, error.failureReason))
            }
            
        }
    }
    
    static func handleDataCustom<T:Codable>(data :AFDataResponse<String>, completion:@escaping (T?)->Void) {
        let result = data.result
        
        switch result {
        case .success(let resData) :
            if let data = resData.replacingOccurrences(of: "\n", with: "\\n").data(using: String.Encoding.utf8) {
                print(resData.replacingOccurrences(of: "\n", with: "\\n"))
                do {
                    let decoder: JSONDecoder = JSONDecoder()
                    let model = try decoder.decode(T.self, from: data)
                    completion(model)
                   
                } catch {
                    NSLog("ERROR \(String(error.localizedDescription))")
                    completion(nil)
                }
            
            }
        case .failure(let error) :
            completion(nil)
            if let code = error.responseCode {
                self.handleError(error: AErrorModel(code: code, error.failureReason))
            }
            
        }
    }
    
}


extension MultipartFormData {
    func appandData(_ dict: [String: String]) {
        for item in dict {
            self.append(item.value.data(using: String.Encoding.utf8)!, withName: item.key)
        }
    }
}
