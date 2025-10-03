//
//  AppLinkManager.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

class AppLinkManager: NSObject {
    
    private var link: String = ""

    static let shared: AppLinkManager = AppLinkManager()
    
    init(_ link: String) {
        super.init()
        self.link = link
        self.initLink()
    }
    
    init(_ url: URL) {
        super.init()
        self.link = url.absoluteString
        self.initLink()
    }
    
    override init() {
        super.init()
    }
    
    func check(completion: ((AppLinkModel) -> Void)?) {
        if let object = SharedManager.appLinkModel , object.isValid {
            completion?(object)
        }
        SharedManager.appLinkModel = nil
    }
    
    func handle(_ link: String? = nil) {
        if let lk = link {
            self.link = lk
        }
        self.initLink()
    }
    
    func handle(_ url: URL?) {
        if let lk = url?.absoluteString {
            self.link = lk
            self.initLink()
        }
    }
    
    private func initLink() {
        if self.checkIfAppLink() {
            SharedManager.appLinkModel = AppLinkModel(link: self.link)
        }
    }
    
    private func checkIfAppLink() -> Bool {
        return self.link.starts(with: URLS.BASE_URL)
    }
}

struct AppLinkModel : Codable {
    
    var id: String?
    var link: String
    var router: AppLinkRoute = .none
    
    var isValid: Bool {
        return (self.router != .none)
    }
    
    init(link: String, id: String? = nil) {
        self.id = id
        self.link = link
        self.initLink()
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case link = "link"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        link = try values.decodeIfPresent(String.self, forKey: .link) ?? ""
        self.initLink()
    }
    
    private mutating func initLink() {
        self.router = .none
        
        // check
        
    let url = "user/notification?id=123&sggs"
        
        let array = url.split(separator: "?")
        self.router =  AppLinkRoute(rawValue: String(array[0])) ?? .none
        
        
    }
}

enum AppLinkRoute : String {

    case notification = "user/notification"

    case none
}



