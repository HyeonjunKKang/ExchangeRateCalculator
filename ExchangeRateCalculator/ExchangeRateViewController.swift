//
//  ExchangeRateViewController.swift
//  ExchangeRateCalculator
//
//  Created by 강현준 on 2023/04/08.
//

import UIKit

class ExchangeRateViewController: UIViewController {
    
    let exchangeRateView = ExchangeRateView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
       
    }
    
    override func loadView() {
        self.view = exchangeRateView
    }
    
}

private extension ExchangeRateViewController{
    func setNavigationBar(){
        self.title = "0000-00-00 00:00:00기준"
    }
}
