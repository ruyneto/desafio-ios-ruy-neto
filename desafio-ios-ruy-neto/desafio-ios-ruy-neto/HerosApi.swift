//
//  HerosApi.swift
//  desafio-ios-ruy-neto
//
//  Created by Ruy de Ascencão Neto on 26/04/20.
//  Copyright © 2020 Ruy Neto. All rights reserved.
//

import Foundation
import CommonCrypto
import SwiftyJSON
class HerosAPI{
    static let originURL    = "https://gateway.marvel.com:443/v1/public/"
    static let publicKey    = "697618806bf94a0321c5d706625d2875"
    static let privateKey   = "91890b2789d8bde67bc2ec975da004e24754b597"
    static let ts           = "1"
    static var hashAPI:String{
        return "\(self.ts)\(self.privateKey)\(self.publicKey)".md5Value
    }
    
    
    static func
        getAllHeros(
            page           : Int,
            successHandler : @escaping HeroList.CompleteHerosSuccessHandler,
            errorHandler   : @escaping HeroList.CompleteHerosErrorHandler
        ){
        let session = URLSession(configuration: .default)
        guard let url     = URL(string: "\(HerosAPI.originURL)characters?hash=f7bdb7165357503e85260e48ba9404a8&ts=1&apikey=697618806bf94a0321c5d706625d2875") else{return }
        session.dataTask(with: url){
            data,response,error in
            
            guard error == nil else {
                errorHandler(error)
                return
            }
            guard let data = data else { return }
            guard let converted   = try? JSONDecoder().decode(CharactersResponse.self, from: data) else {return }
            successHandler(converted)
        }.resume()
    }
    
}


extension String {
    var md5Value: String {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        var digest = [UInt8](repeating: 0, count: length)

        if let d = self.data(using: .utf8) {
            _ = d.withUnsafeBytes { body -> String in
                CC_MD5(body.baseAddress, CC_LONG(d.count), &digest)

                return ""
            }
        }

        return (0 ..< length).reduce("") {
            $0 + String(format: "%02x", digest[$1])
        }
    }
}
