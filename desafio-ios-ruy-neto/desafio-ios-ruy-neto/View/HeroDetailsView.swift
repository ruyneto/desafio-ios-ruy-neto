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
    let spinner           = UIActivityIndicatorView(style: .large)
    let imageView         = UIImageView(frame: .zero)
    let labelName         = UILabel(frame: .zero)
    let labelDescription  = UILabel(frame: .zero)
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
        self.labelDescription.numberOfLines = 3
        self.labelDescription.textAlignment = .center
    }
    func loadSubviews(){
        sv([
//            spinner,
            imageView,
            labelName,
            labelDescription
        ])
    }
    func loadLayout(){
        labelName.centerInContainer()
//        spinner.centerInContainer()
//        spinner.startAnimating()
        layout(30,imageView.centerHorizontally(), labelName,30,|-labelDescription.centerHorizontally()-|)
    }
}
