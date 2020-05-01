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
    let biggerDetailsVM = BiggerPriceViewModel()
    let biggerView      = BiggerPriceView()
    init(id:Int){
        super.init(nibName: nil, bundle: nil)
        self.view                 = biggerView
        self.view.backgroundColor = .white
        self.navigationItem.title = biggerDetailsVM.navigationTitle
        loadHero(id:id)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BiggerPriceViewController{
    
    func loadHero(id:Int){
        print("Id Recebido, \(id)")
        
        HerosAPI.getHeroComics(id: id, successHandler: successHandler, errorHandler: errorHandler)
    }
    
    func loadInformation(){
        if(!biggerDetailsVM.hasZeroComics){
            DispatchQueue.main.async {
               // print(self.biggerDetailsVM.bigger)
                self.biggerView.titleLabel.text       = self.biggerDetailsVM.bigger!["title"].string!
                self.biggerView.descriptionLabel.text = self.biggerDetailsVM.bigger!["description"].string!
                self.biggerView.priceLabel.text       = "Preço: US$ \(self.biggerDetailsVM.biggerPrice!)"
                let imageURL    = self.biggerDetailsVM.bigger!["thumbnail"]["path"].string!
                let completeURL = "\(imageURL)/\("portrait_xlarge.jpg")".replacingOccurrences(of: "http", with: "https")
                if !completeURL.contains("image_not_available"){
                    let url = URL(string: completeURL)

                    let image = try! Data(contentsOf: url! )
                    let uiImage = UIImage(data: image)
                    self.biggerView.imageView.image = uiImage
                }else{
                    let uiImage = UIImage(named: "bad_face")
                    self.biggerView.imageView.image = uiImage
                }
            }
        }else{
            // create the alert
            let alert = UIAlertController(title: "Opa, um problema", message: "Parece que esse herói não tem HQs registradas.", preferredStyle: UIAlertController.Style.alert)

            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {_
                in
                self.navigationController?.popViewController(animated: true)
            }))

            // show the alert
            self.present(alert, animated: true, completion: nil)
            
        }
    }
}


//MARK: Handlers
extension BiggerPriceViewController{
    
    func successHandler(resp:JSON){
        self.biggerDetailsVM.orderPrice(resp["data"]["results"])
        self.biggerDetailsVM.getBigger()
        self.loadInformation()
    }
    
    func errorHandler(error:Any){
        
    }
}
