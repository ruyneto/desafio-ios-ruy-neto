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
    let navigationTitle              = "HQ mais cara"
    var dictionary:[String:Double]   = [:]
    var biggerId                     = ""
    var listOfComics:[JSON]?
    var bigger:JSON?
    var biggerPrice:Double?
    var hasZeroComics = false
    func orderPrice(_ list:JSON){
        self.listOfComics = list.array
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
        
        guard [String](dictionary.keys).count>0 else{
            hasZeroComics = true
            return}
        var biggerid    = [String](dictionary.keys)[0]
        var biggerprice = dictionary[[String](dictionary.keys)[0]]!
        
        for id in [String](dictionary.keys) {
            if(dictionary[id]! >= biggerprice){
                biggerprice = dictionary[id]!
                biggerid    = id
            }
        }
        self.biggerId = biggerid
        self.biggerPrice = biggerprice
        print(" \(biggerid) \(biggerprice) ")
    }
    func getBigger(){
        if(!self.hasZeroComics){
            let filtred = self.listOfComics?.filter({comic in
                return "\(comic["id"].int!)" == self.biggerId
            })
            self.bigger = filtred![0]
        }
    }
}
