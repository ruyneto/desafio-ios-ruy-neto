//
//  HeroDetailsView.swift
//  desafio-ios-ruy-neto
//
//  Created by Ruy de Ascencão Neto on 30/04/20.
//  Copyright © 2020 Ruy Neto. All rights reserved.
//

import Foundation
import UIKit
import Stevia

class HeroDetailsView:UIView{
    let imageView         = UIImageView(frame: .zero)
    let labelName         = UILabel(frame: .zero)
    let labelDescription  = UILabel(frame: .zero)
    let buttonHighPrice   = UIButton(frame: .zero)
    init(){
        super.init(frame: .zero)
        loadStyle()
        loadSubviews()
        loadLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeroDetailsView{
    func loadStyle(){
        self.backgroundColor = .white
        self.labelDescription.numberOfLines  = 3
        self.labelDescription.textAlignment  = .center
        self.buttonHighPrice.text("HQ mais cara")
        self.buttonHighPrice.backgroundColor  = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        self.buttonHighPrice.titleLabel!.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.buttonHighPrice.layer.cornerRadius = 10.0
        
    }
    func loadSubviews(){
        sv([
            imageView,
            labelName,
            labelDescription,
            buttonHighPrice
        ])
    }
    func loadLayout(){
        labelName.centerInContainer()
        layout(60,|-50-imageView.centerHorizontally()-50-|, labelName,30,|-labelDescription.centerHorizontally()-|,30,|-20-buttonHighPrice-20-|)
    }
}
