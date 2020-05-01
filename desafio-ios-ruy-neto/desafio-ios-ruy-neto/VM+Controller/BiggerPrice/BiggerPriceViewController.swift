//
//  HeroDetailsViewController.swift
//  desafio-ios-ruy-neto
//
//  Created by Ruy de Ascencão Neto on 30/04/20.
//  Copyright © 2020 Ruy Neto. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class BiggerPriceViewController:UIViewController{
    let heroDetailsVM = BiggerPriceViewModel()
    init(id:Int){
        super.init(nibName: nil, bundle: nil)
        self.view                 = UIView()
        self.view.backgroundColor = .white
        self.navigationItem.title = heroDetailsVM.navigationTitle
        loadHero(id:id)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BiggerPriceViewController{
    func loadHero(id:Int){
        print("Id Recebido, \(id)")
        HerosAPI.getHeroDetail(id: id, successHandler: successHandler, errorHandler: errorHandler)
    }
}


//MARK: Handlers
extension BiggerPriceViewController{
    func successHandler(resp:JSON){
        self.heroDetailsVM.orderPrice(resp["data"]["results"])
    }
    
    func errorHandler(error:Any){
        
    }
}
