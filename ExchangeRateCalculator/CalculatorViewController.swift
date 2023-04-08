//
//  CalculatorViewController.swift
//  ExchangeRateCalculator
//
//  Created by 강현준 on 2023/04/08.
//

import UIKit

final class CalculatorViewController: UIViewController {
    
    let calculotorView = CalculatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
    }
    
    override func loadView() {
        self.view = calculotorView
    }
    
}

private extension CalculatorViewController{
    func setNavigationBar(){
        title = "환율계산기"
        
    }
}
