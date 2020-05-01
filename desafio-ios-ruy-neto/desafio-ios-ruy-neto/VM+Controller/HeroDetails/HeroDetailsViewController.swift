//
//  HeroDetailsViewController.swift
//  desafio-ios-ruy-neto
//
//  Created by Ruy de Ascencão Neto on 01/05/20.
//  Copyright © 2020 Ruy Neto. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON


class HeroDetailsViewController:UIViewController{
    let viewDetail    = HeroDetailsView()
    var heroDetailsVM = HeroDetailsViewModel()
    init(id:Int){
        super.init(nibName: nil, bundle: nil)
        self.view = viewDetail
        self.navigationItem.title = heroDetailsVM.navigationTitle
        loadDetails(id: id)
        loadButtonHandler()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeroDetailsViewController{
    func loadDetails(id:Int){
        HerosAPI.getHeroDetail(id: id, successHandler: successHandler, errorHandler: errorHandler)
    }
}


//MARK: Handlers
extension HeroDetailsViewController{
    func loadButtonHandler(){
        self.viewDetail.buttonHighPrice.addTarget(self, action: #selector(biggerPriceButton), for: .touchDown)
    }
    
    @objc func biggerPriceButton(){
        navigate(MyNavigation.BiggerPrice(heroDetailsVM.heroDetails!["id"].int!))
    }
    func successHandler(resp:JSON){
   
        heroDetailsVM.heroDetails        = resp["data"]["results"].array![0]
        DispatchQueue.main.async {
            self.viewDetail.labelName.text        = self.heroDetailsVM.heroName
            self.viewDetail.labelDescription.text = self.heroDetailsVM.heroDescription
        }
        
        let imageURL = self.heroDetailsVM.heroDetails!["thumbnail"]["path"].string!
        let completeURL = "\(imageURL)/\("portrait_xlarge.jpg")".replacingOccurrences(of: "http", with: "https")
        if !completeURL.contains("image_not_available"){
            let url = URL(string: completeURL)

            let image = try! Data(contentsOf: url! )
            let uiImage = UIImage(data: image)
            DispatchQueue.main.async {
                self.viewDetail.imageView.image = uiImage
            }
        

        }else{
            DispatchQueue.main.async {
                let uiImage = UIImage(named: "bad_face")
                self.viewDetail.imageView.image = uiImage
                
            }
        }
    }
    
    func errorHandler(error:Any){
        
    }
}
