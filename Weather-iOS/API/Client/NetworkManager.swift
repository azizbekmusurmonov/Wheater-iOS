//
//  APIClient.swift
//  Weather-iOS
//
//  Created by Azizbek Musurmonov   on 02/10/25.
//

import Foundation
import Alamofire
import UIKit

class NetworkManager {
    
    static let shared: NetworkManager = {
        return NetworkManager()
    }()
    
    var request: Alamofire.Request?
    
    let retryLimit = 3
    
    let retryDelay: TimeInterval = 2
    
    var isRetrying = false
    
    func performRequestScale<T:Codable>(route: URLRequestConvertible  , decoder: JSONDecoder = JSONDecoder(), completion:@escaping (AFDataResponse<T>)->Void) {
        AF.request(route, interceptor: self).mValidate()
            .responseDecodable (decoder: decoder){ (response: AFDataResponse<T>) in
                completion(response)
            }
    }
    
    func performRequestString(route: URLRequestConvertible  ,  completion:@escaping (AFDataResponse<String>)->Void) {
        AF.request(route, interceptor: self).mValidate().responseString { (result) in
            completion(result)
        }
    }
    
    func performRequestData(route: URLRequestConvertible, throwLogin: Bool = true, completion: @escaping (AFDataResponse<Data>)->Void) {
        AF.request(route, interceptor: self).mValidate().responseData { (result) in
            completion(result)
        }
    }
    
    func performUploadString(route:URLRequestConvertible, mData: [String: String],file: UIImage? = nil, throwLogin: Bool = true, fileName: String = "file",  completion:@escaping (AFDataResponse<String>)->Void) {
        AF.upload(multipartFormData:{ multipartFormData in
            multipartFormData.appandData(mData)
            if let file = file {
                var imageSize: Double = 1
                var compressionQuality = 1.0
                
                if let data = file.jpegData(compressionQuality: CGFloat(compressionQuality)) {
                    imageSize = Double(data.count) / 1024.0
                    
                    if imageSize > 1000 {
                        compressionQuality = 1000 / imageSize
                    }
                }
                
                if let imageData = file.jpegData(compressionQuality:  CGFloat(compressionQuality)) {
                    multipartFormData.append(imageData, withName: fileName, fileName: "file.jpeg", mimeType: "image/jpeg")
                }
            }
        }, with: route, interceptor: self).mValidate().responseString { (result) in
            completion(result)
        }
    }
    
}


extension NetworkManager: RequestInterceptor {
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        //MARK: - your saved token, do not forget to uncomment
//        guard let token = SharedManager.getAccessToken() else {
//            completion(.success(urlRequest))
//            return
//        }
//        request.setValue("Bearer \(token)", forHTTPHeaderField: HTTPHeaderField.access_token.rawValue)
        
        completion(.success(request))
    }
    

    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
            let response = request.task?.response as? HTTPURLResponse
            if request.retryCount < self.retryLimit {
                if let statusCode = response?.statusCode, statusCode == 401, !isRetrying {
                    self.isRetrying = true
                    self.determineError(error: error, completion: completion)
                } else {
                    completion(.retryWithDelay(self.retryDelay))
                }
            } else {
                //
                completion(.doNotRetry)
            }
        }
    
    private func determineError(error: Error, completion: @escaping (RetryResult) -> Void) {
           if let afError = error as? AFError {
               switch afError {
               case .responseValidationFailed(let reason):
                   self.determineResponseValidationFailed(reason: reason, completion: completion)
               default:
                   self.isRetrying = false
                   completion(.retryWithDelay(self.retryDelay))
               }
           }
       }
    
    private func determineResponseValidationFailed(reason: AFError.ResponseValidationFailureReason, completion: @escaping (RetryResult) -> Void) {
           switch reason {
           case .unacceptableStatusCode(let code):
               switch code {
               case AuthenticationAction.refreshToken.rawValue:
                   refreshToken { isSuccess in
                       self.isRetrying = false
                       completion(.retryWithDelay(self.retryDelay))
                   }
        
               default: // AuthenticationAction.logout.rawValue
                   self.isRetrying = false
                   // Redirect to the login page
                   completion(.doNotRetry)
               }
           default:
               self.isRetrying = false
               completion(.retryWithDelay(self.retryDelay))
           }
       }
    
    func refreshToken(completion: @escaping (_ isSuccess: Bool) -> Void) {
        ApiClient.performRequestJSONERefresh(route: .refreshToken) {
            response in
                completion(response)
        }
        
    }
    
}


extension DataRequest {
    func mValidate() -> Self {
        return self.validate { request, response, data -> Request.ValidationResult in
            let statusCode = response.statusCode
            if statusCode != 401 {
                return .success(())
            } else {
                let authenticationAction = self.getAuthenticationAction(request?.url?.absoluteString ?? "", statusCode: statusCode, data: data)
                return .failure(AFError.responseValidationFailed(reason: .unacceptableStatusCode(code: authenticationAction.rawValue)))
            }
        }
    }
    
    private func getAuthenticationAction(_ endpoint: String? = "", statusCode: Int, data: Data?) -> AuthenticationAction {
        let authenticationAction = AuthenticationAction(rawValue: statusCode) ?? .undefinedAction
        return authenticationAction
    }
}

enum AuthenticationAction: Int {
    case refreshToken = 401
    case undefinedAction = 0
}

