//
//  KeyChainManager.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit
import KeychainAccess

public class MKeychainManager {
    
    //singleton
    public static let shared = MKeychainManager()
    
    internal var uuid : String
    
    init() {
        self.uuid = ""
        if let ud = self.deviceUUID {
            self.uuid = ud
        }
    }
    
    private var appKeychain : Keychain {
        return Keychain(service: MKeychainKeyManager.serviceKey)
    }

    private var deviceUUID:String? {
        set(newValue) {
            if let val = newValue {
                appKeychain[string: MKeychainKeyManager.uuidKey] = val
                self.uuid = val
            } else {
                appKeychain[MKeychainKeyManager.uuidKey] = nil
            }
        } get {
            return appKeychain[MKeychainKeyManager.uuidKey]
        }
    }
    

    public func initSelf() {
        if nil == MKeychainManager.shared.deviceUUID {
            MKeychainManager.shared.deviceUUID = UIDevice.current.identifierForVendor?.uuidString
        }
    }
}

public class MKeychainKeyManager {
        
    public static let serviceKey = [127, 129, 48, 121, 106, 109, 116, 119, 47, 121, 109, 115, 113, 114, 107, 115, 103, 49, 115, 106, 121, 111, 108, 117, 118, 110, 105, 106, 110, 47, 121, 106, 109, 116, 119, 127, 57].uints.keyString
    
    public static let uuidKey = [119, 130, 96, 121, 107, 116, 121, 101, 120, 106, 115, 122, 113, 104, 110, 96, 115, 97, 116, 110, 106, 106].uints.keyString
    
   
}

extension Array where Element == UInt8 {
    
    var keyString : String {
        let obj = self.getRealKeychain()
        return String(data: Data(obj), encoding: .utf8) ?? ""
    }
    
    var uints: [UInt8] {
        var arrayn = [UInt8]()
        for item in self {
            arrayn.append(UInt8(item))
        }
        return arrayn
    }
    

    func getRealKeychain() -> [UInt8] {
        let arr = self
        var last = arr.last ?? arr[arr.count - 1]
        var array = arr
        array.removeLast()
        let rand = last - (array.min() ?? 0)
        
        let count = Int(rand % 3)
        array.removeLast(count)
        
        var arrayn = [UInt8]()
        var nextRand : UInt8 = rand
        for i in 0 ..< array.count {
            arrayn.append(array[i] - nextRand)
            nextRand = arrayn[i] % rand
        }
        return arrayn
    }
}

extension String {
    
    func bytesToKeychain() -> [UInt8]{
        var array = [UInt8]()
        for item in self.utf8 {
            array.append(item)
        }
        return array
    }
    
}


