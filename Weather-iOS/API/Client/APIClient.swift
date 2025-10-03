//
//  APIClient.swift
//  Weather-iOS
//
//  Created by Azizbek Musurmonov   on 02/10/25.
//

import Foundation
import Alamofire
import UIKit


class ApiClient {
    
   
    static func performRequestScale<T:Codable>(route:ApiRouter , decoder: JSONDecoder = JSONDecoder(), completion:@escaping (T?)->Void) {
        NetworkManager.shared.performRequestScale(route: route) { (response: AFDataResponse<ADataModel<T>>)  in
                self.handleSHARE(response.sharedResponse())
                self.handleData(data: response) { data in
                    completion(data)
                }
            }
    }
    
    
    static func performRequestJSONE<T:Codable>(route:ApiRouter ,  completion:@escaping (T?)->Void) {
        NetworkManager.shared.performRequestString(route: route) { result in
                self.handleSHARE(result.sharedResponse())
                self.handleData(data: result) { data in
                    completion(data)
                }
            }
        
    }
    
    static func performRequestJSONEData<T: Codable>(route: ApiRouter, throwLogin: Bool = true, completion: @escaping (ADataModel<T>?)->Void) {
        
        NetworkManager.shared.performRequestData(route: route, throwLogin: throwLogin) { (result) in
            
            self.handleSHARE(result.sharedResponse())
            self.handleData(data: result) { data in
                completion(data)
            }
        }
    }

    static func performUploadJSONE<T:Codable>(route:ApiRouter, mData: [String: String],file: UIImage? = nil, fileName: String = "file",  completion:@escaping (T?)->Void)  {
        NetworkManager.shared.performUploadString(route: route, mData: mData,file: file, fileName: fileName) { (result)  in
            self.handleSHARE(result.sharedResponse())
            self.handleData(data: result) { data in
                completion(data)
            }
        }
    }
    
    
    static func performRequestJSONECustom<T:Codable>(route:ApiRouter ,  completion:@escaping (T?)->Void) -> DataRequest {
        return AF.request(route)
            .responseString { (result) in
                self.handleSHARE(result.sharedResponse())
                self.handleDataCustom(data: result) { data in
                    completion(data)
                }
            }
        
        
    }
    
    
    static func performRequestJSONERefresh(route:ApiRouter ,  completion:@escaping (Bool)->Void) {
        
        AF.request(route)
            .responseString { (result) in
            self.handleSHARE(result.sharedResponse())
            switch result.result {
            case .success(let resData) :
                if let data = resData.replacingOccurrences(of: "\n", with: "\\n").data(using: String.Encoding.utf8) {
                   
                    if result.response?.statusCode == 401 {
                        //MARK: - log out
                        completion(false)
                    } else {
                      //MARK: - decode to your model and save tokens
                        
                        completion(true)
                    }
                    
                } else {
                    completion(false)
                }
                
            case .failure(let error) :
            
                completion(false)
            }
            
        }
    }
    
}
