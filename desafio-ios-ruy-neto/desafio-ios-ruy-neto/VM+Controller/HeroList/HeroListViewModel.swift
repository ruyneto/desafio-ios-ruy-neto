//
//  HeroListViewModel.swift
//  desafio-ios-ruy-neto
//
//  Created by Ruy de Ascencão Neto on 27/04/20.
//  Copyright © 2020 Ruy Neto. All rights reserved.
//

import UIKit

class HeroListViewModel {
    var page           = 0;
    var listHero       :[Results] = []
    var isLoadingHeros = false
    func updateStateLoading(){
        self.isLoadingHeros = !self.isLoadingHeros
    }
}
