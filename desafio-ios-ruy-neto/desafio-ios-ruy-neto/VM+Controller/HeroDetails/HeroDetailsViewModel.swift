//
//  HeroDetailsViewModel.swift
//  desafio-ios-ruy-neto
//
//  Created by Ruy de Ascencão Neto on 01/05/20.
//  Copyright © 2020 Ruy Neto. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class HeroDetailsViewModel{
    var navigationTitle   = "Detalhes"
    var heroDetails:JSON?
    var heroName:String{
        return heroDetails!["name"].string!
    }
    var heroDescription:String{
        return heroDetails!["description"].string!.count==0 ? "Sem Descrição":heroDetails!["description"].string!
    }
}
