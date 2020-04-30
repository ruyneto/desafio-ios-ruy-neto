//
//  ViewController.swift
//  desafio-ios-ruy-neto
//
//  Created by Ruy de Ascencão Neto on 25/04/20.
//  Copyright © 2020 Ruy Neto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tabela: UITableView!
    
    let lista  = Array(1...101)
    var limite = 20
    let getHerosSucessHandler:HeroList.CompleteHerosSuccessHandler = {
           data in
        print(data)
    }
    let getHerosErrorHandler:HeroList.CompleteHerosErrorHandler = {
            error in

    }
}

extension ViewController{
    override func viewDidLoad() {
       super.viewDidLoad()
       // Do any additional setup after loading the view.
       tabela.delegate   = self
       tabela.dataSource = self
       HerosAPI.getAllHeros(page: 10, successHandler: getHerosSucessHandler, errorHandler: getHerosErrorHandler)
    }
}

extension ViewController:UITableViewDelegate{

}

extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.limite
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(lista[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == self.limite {
            print(((self.limite + 20) < (lista.count - 1)) ? 20:(lista.count - 1 - self.limite))
            self.limite += ((self.limite + 20) < (lista.count - 1)) ? 20:(lista.count - 1 - self.limite)
            self.tabela.reloadData()
        }
    }
    

}
