//
//  HeroListCell.swift
//  desafio-ios-ruy-neto
//
//  Created by Ruy de Ascencão Neto on 30/04/20.
//  Copyright © 2020 Ruy Neto. All rights reserved.
//

import Foundation
import UIKit
import Stevia

class HeroListCell:UITableViewCell{
    let titleView = HeroCellTitleView()
    
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
//        sv([heroImage,titleView])
        sv([titleView])
    }
    func loadLayout(){
//        heroImage.centerInContainer()
        titleView.bottom(20).left(20).right(20).top(20)
    }
    func loadStyle(){
    }
}

class HeroCellTitleView:UIView{
    let labelName    = UILabel(frame: .zero)
    let heroImage    = UIImageView(frame: .zero)
    let labelLoading = UILabel(frame: .zero)
    init(){
        super.init(frame: .zero)
        loadSubViews()
        loadLayout()
        loadStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeroCellTitleView{
    func loadSubViews(){
        sv([labelName,labelLoading,heroImage])
    }
    func loadLayout(){
        labelLoading.centerInContainer()
        layout(20,heroImage.centerHorizontally(),|-20-labelName-20-|,20)
        labelName.numberOfLines = 3
        labelName.lineBreakMode = .byTruncatingTail
        labelName.font = labelName.font.withSize(12)
        labelName.textAlignment = .center
    }
    func loadStyle(){
        labelLoading.text = "Aguarde carregando imagem."
        labelLoading.isHidden=true
        self.layer.cornerRadius = 30
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
    }
    
}
