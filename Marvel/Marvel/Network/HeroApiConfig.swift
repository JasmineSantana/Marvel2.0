//
//  HeroApiConfig.swift
//  Marvel
//
//  Created by iOSLab on 10/08/24.
//

import Foundation
import CryptoKit

enum ApiKeys: String {
    case privateKey = "5dbde72c7ebed9993d4feb31c76d07b55f5327dc"
    case publicKey = "dcc9d8accfac05ed707fa07aabce6e00"
}

class HeroApiConfig {
    private let timestamp = String(Int(Date().timeIntervalSince1970 * 1000))
    
    private var md5: String {
        let keyString = timestamp + ApiKeys.privateKey.rawValue + ApiKeys.publicKey.rawValue
        let digest = Insecure.MD5.hash(data: Data(keyString.utf8))

        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
    
    var url: URL? {
        let baseURL = NetworkConstants.baseURL + NetworkConstants.baseEndpoint + NetworkConstants.heroEndpoint
        
        let url = "\(baseURL)?ts=\(timestamp)&apikey=\(ApiKeys.publicKey.rawValue)&hash=\(md5)"
        return URL(string: url)
    }
        
}
