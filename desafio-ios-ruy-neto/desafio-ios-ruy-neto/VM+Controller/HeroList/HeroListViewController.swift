//
//  HeroListViewController.swift
//  desafio-ios-ruy-neto
//
//  Created by Ruy de Ascencão Neto on 27/04/20.
//  Copyright © 2020 Ruy Neto. All rights reserved.
//

import Foundation
import UIKit

class HeroListViewController:UIViewController{
    var heroListVM   = HeroListViewModel()
    var heroListView = HeroListView()
    init(){
        super.init(nibName: nil, bundle: nil)
        self.view = self.heroListView
        loadHeros()
        setTableConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HeroListViewController{
    func loadHeros(){
        self.heroListVM.page += 1
        HerosAPI.getAllHeros(page: self.heroListVM.page, successHandler: getHerosSucessHandler, errorHandler: getHerosErrorHandler)
    }
    
    func setTableConfiguration(){
        self.heroListView.heroTable.dataSource = self
        self.heroListView.heroTable.delegate   = self
    }
    
}

//MARK: Handlers
extension HeroListViewController{
    func getHerosSucessHandler(data:CharactersResponse) {
        self.heroListVM.listHero.append(contentsOf: data.data.results)
        DispatchQueue.main.async {
            self.heroListView.heroTable.reloadData()
        }
    }
    
    func getHerosErrorHandler(error:Any)  {
            
    }
}


//MARK: DataSource
extension HeroListViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return self.heroListVM.listHero.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellHero") as! HeroListCell
        cell.labelName.text = heroListVM.listHero[indexPath.row].name
            let imageURL    = self.heroListVM.listHero[indexPath.row].thumbnail?.path
            let completeURL = "\(imageURL!)/\("portrait_xlarge.jpg")".replacingOccurrences(of: "http", with: "https")
            if !completeURL.contains("image_not_available"){
                let url = URL(string: completeURL)
                print("Valor da url \(url)")
                let image = try! Data(contentsOf: url! )
                cell.heroImage.image = UIImage(data: image)
            }
        
        return cell
    }
}

//MARK: TableDelegate

extension HeroListViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print(indexPath.row)
        if(indexPath.row == (self.heroListVM.listHero.count - 1)){
            self.loadHeros()
        }
    }
}
