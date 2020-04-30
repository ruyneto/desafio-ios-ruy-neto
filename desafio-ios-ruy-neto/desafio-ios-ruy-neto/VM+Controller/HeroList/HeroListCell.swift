//
//  HeroListCell.swift
//  desafio-ios-ruy-neto
//
//  Created by Ruy de Ascencão Neto on 30/04/20.
//  Copyright © 2020 Ruy Neto. All rights reserved.
//

import Foundation
import UIKit

class HeroListCell:UITableViewCell{
    let heroImage = UIImageView(frame: .zero)
    let labelName = UILabel(frame: .zero)
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        loadSubViews()
        loadLayout()
        loadStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeroListCell{
    func loadSubViews(){
        sv([heroImage,labelName])
    }
    func loadLayout(){
        heroImage.centerInContainer()
        labelName.centerInContainer()
    }
    func loadStyle(){
        self.backgroundColor = .red
    }
}
