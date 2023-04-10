//
//  CalculatorViewController.swift
//  ExchangeRateCalculator
//
//  Created by 강현준 on 2023/04/08.
//

import UIKit

final class CalculatorViewController: UIViewController {
    
    let calculatorModel = CalculatorModel()
    
    let calculotorView = CalculatorView()
    
    lazy var numPadButton = [calculotorView.zeroButton,
                        calculotorView.oneButton,
                        calculotorView.twoButton,
                        calculotorView.threeButton,
                        calculotorView.fourButton,
                        calculotorView.fiveButton,
                        calculotorView.sixButton,
                        calculotorView.sevenButton,
                        calculotorView.eightButton,
                        calculotorView.nineButton]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        setButton()
        numPadUnEnable()
    }
    
    override func loadView() {
        self.view = calculotorView
    }
}

extension CalculatorViewController: SelectDelegate{
    func selectExchangeCountry(country: ExchangeRateModel) {
        self.calculatorModel.exchangeTarget = country
        
        DispatchQueue.main.async { [weak self] in
            self?.calculotorView.resultCountryLabel.text = "\(country.curUnit)"
        }
        numPadEnable()
    }
}

private extension CalculatorViewController{
    func setNavigationBar(){
        title = "환율계산기"
    }
    
    func setButton(){
        calculotorView.selectCountrySelectButton.addTarget(self, action: #selector(selectCountrySelectButtonTapped), for: .touchUpInside)
        calculotorView.clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        
        for i in 0..<numPadButton.count{
            numPadButton[i].tag = i
        }
        
        numPadButton.forEach{ $0.addTarget(self, action: #selector(numPadTapped(_:)), for: .touchUpInside)}
    }
    
    @objc func selectCountrySelectButtonTapped(){
        let selectCountryVC = SelectCounturyViewController()
        selectCountryVC.exchangeRateModel = NetworkManagerModel.shared.exchangeRateModel.rateData
        selectCountryVC.delegate = self
        selectCountryVC.title = "계산대상국 선택"
        
        self.navigationController?.pushViewController(selectCountryVC, animated: true)
    }
    
    @objc func numPadTapped(_ sender: UIButton){
        switch sender.tag{
        case 0:
            if Int("\(self.calculatorModel.krValue)" + "0") ?? 0 != 0{
                self.calculatorModel.krValue = Int("\(self.calculatorModel.krValue)" + "0") ?? 0
            }
        case let num:
                self.calculatorModel.krValue = Int("\(self.calculatorModel.krValue)" + ("\(num)")) ?? 0
        }
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.calculotorView.selectExchangeLabel.text = "\(self.calculatorModel.krValue)"
            self.calculotorView.resultExchangeLabel.text = "\(self.calculatorModel.exchangeValue)"
        }
    }

    @objc func clearButtonTapped(){
        self.calculatorModel.krValue = 0
        self.calculatorModel.exchangeValue = 0
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.calculotorView.selectExchangeLabel.text = "\(self.calculatorModel.krValue)"
            self.calculotorView.resultExchangeLabel.text = "\(self.calculatorModel.krValue)"
        }
    }
    
    func numPadUnEnable(){
        numPadButton.forEach{
            $0.isEnabled = false
        }
    }
    
    func numPadEnable(){
        numPadButton.forEach{
            $0.isEnabled = true
        }
    }
}




