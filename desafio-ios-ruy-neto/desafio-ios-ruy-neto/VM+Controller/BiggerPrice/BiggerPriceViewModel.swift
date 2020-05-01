//
//  HeroDetailsViewModel.swift
//  desafio-ios-ruy-neto
//
//  Created by Ruy de Ascencão Neto on 30/04/20.
//  Copyright © 2020 Ruy Neto. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
class BiggerPriceViewModel{
    var id:Int!
    let navigationTitle              = "Detalhes"
    var dictionary:[String:Double]   = [:]
    var biggerId                     = ""
    
    func orderPrice(_ list:JSON){
        for comic in list.array!{
            let id = comic["id"]
            
            //descobrirmaior
            var biggerPrice = 0.0
            for info in comic["prices"].array!{
                if(info["price"].double! > biggerPrice){
                    biggerPrice = info["price"].double!
                }
            }
            dictionary["\(id)"] = biggerPrice
        }
        
        
        var biggerid    = [String](dictionary.keys)[0]
        var biggerprice = dictionary[[String](dictionary.keys)[0]]!
        
        for id in [String](dictionary.keys) {
            if(dictionary[id]! >= biggerprice){
                biggerprice = dictionary[id]!
                biggerid    = id
            }
        }
        self.biggerId = biggerid
        print(" \(biggerid) \(biggerprice) ")
    }
}
