//
//  CalculatorModel.swift
//  ExchangeRateCalculator
//
//  Created by 강현준 on 2023/04/09.
//

import Foundation

final class CalculatorModel{
    var krValue: Int = 0{
        didSet{
            calculate()
            print("krvalue : \(krValue)")
        }
    }
    
   var exchangeValue: Double = 0
    
    var exchangeTarget: ExchangeRateModel?{
        didSet{
            switch exchangeTarget?.curUnit{
            
            case "IDR(100)":
                basedPer = 100
                break
            case "JPY(100)":
            basedPer = 100
                break
            default:
                basedPer = 1
            }
        }
    }
    
    var basedPer = 1
    
    private func calculate(){
        guard let target = exchangeTarget else{ return }
        
        let removeDot = target.dealBasR.replacingOccurrences(of: ",", with: "")
        
        if let dealBasR = Double(removeDot){
            exchangeValue = ((Double(krValue) / dealBasR) * 100).rounded() / 100
        }
    }
    
}
