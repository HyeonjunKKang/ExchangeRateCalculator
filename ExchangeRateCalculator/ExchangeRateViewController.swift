//
//  ExchangeRateViewController.swift
//  ExchangeRateCalculator
//
//  Created by 강현준 on 2023/04/08.
//

import UIKit

class ExchangeRateViewController: UIViewController {
    
    let networkManager = NetworkManagerModel.shared
    
    let exchangeRateView = ExchangeRateView()
    
    override func loadView() {
        self.view = exchangeRateView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
        
        exchangeRateView.exchangeRateData = networkManager.exchangeRateModel.rateData
    }
    
    
    
}

private extension ExchangeRateViewController{
    func setNavigationBar(){
        self.title = "\(networkManager.exchangeRateModel.basedDate) \(networkManager.exchangeRateModel.basedTime)기준"
    }
}
