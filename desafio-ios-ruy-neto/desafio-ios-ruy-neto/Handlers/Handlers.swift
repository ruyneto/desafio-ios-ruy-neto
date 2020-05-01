//
//  Handlers.swift
//  desafio-ios-ruy-neto
//
//  Created by Ruy de Ascencão Neto on 26/04/20.
//  Copyright © 2020 Ruy Neto. All rights reserved.
//

import Foundation
import SwiftyJSON
struct HeroList{
    typealias CompleteHerosSuccessHandler = (_ dataHeros:CharactersResponse)->Void
    typealias CompleteHerosErrorHandler   = (_ error:Any?)->Void
}
struct HeroDetails{
    typealias CompleteHeroDetailHandler = (_ heroDetail:JSON)->Void
    typealias ErrorHeroDetailHandler    = (_ error:Any?)->Void
}
