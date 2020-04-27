//
//  Handlers.swift
//  desafio-ios-ruy-neto
//
//  Created by Ruy de Ascencão Neto on 26/04/20.
//  Copyright © 2020 Ruy Neto. All rights reserved.
//

import Foundation

struct HeroList{
    typealias CompleteHerosSuccessHandler = (_ dataHeros:Any?)->Void
    typealias CompleteHerosErrorHandler   = (_ error:Any?)->Void
}
