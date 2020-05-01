//
//  HeroListView.swift
//  desafio-ios-ruy-neto
//
//  Created by Ruy de Ascencão Neto on 27/04/20.
//  Copyright © 2020 Ruy Neto. All rights reserved.
//

import Foundation
import UIKit
import Stevia

class HeroListView:UIView{
    var heroTable:UITableView!
    init(){
        super.init(frame: .zero)
        loadSubViews()
        loadLayouts()
        loadStyle()
        heroTable.register(HeroListCell.self, forCellReuseIdentifier: "cellHero")
        heroTable.rowHeight = 400
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeroListView{
    func loadSubViews(){
        heroTable = UITableView()
        sv([heroTable])
    }
    func loadLayouts(){
        heroTable.left(0).right(0).top(0).bottom(0)
    }
    func loadStyle(){
        self.backgroundColor = .blue
        self.heroTable.separatorStyle = .none
        
    }
}
