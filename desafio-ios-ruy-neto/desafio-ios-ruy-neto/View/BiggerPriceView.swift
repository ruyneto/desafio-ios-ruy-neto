//
//  BiggerPriceView.swift
//  desafio-ios-ruy-neto
//
//  Created by Ruy de Ascencão Neto on 01/05/20.
//  Copyright © 2020 Ruy Neto. All rights reserved.
//

import Foundation
import UIKit
import Stevia

class BiggerPriceView:UIView{
    let titleLabel       = UILabel(frame: .zero)
    let imageView        = UIImageView(frame: .zero)
    let descriptionLabel = UILabel(frame: .zero)
    let priceLabel       = UILabel(frame: .zero)
    init(){
        super.init(frame: .zero)
        loadSubView()
        loadLayout()
        loadStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BiggerPriceView{
    func loadSubView(){
        sv([
        titleLabel,
        imageView ,
        descriptionLabel,
        priceLabel
        ])
    }
    func loadLayout(){

        layout(100,|-10-titleLabel-10-|,imageView.centerHorizontally() ,|-10-descriptionLabel-10-|,30,priceLabel.centerHorizontally())
    }
    func loadStyle(){
        self.titleLabel.numberOfLines = 0
        self.descriptionLabel.numberOfLines = 3
        
        
        self.backgroundColor = .white
    }
}
