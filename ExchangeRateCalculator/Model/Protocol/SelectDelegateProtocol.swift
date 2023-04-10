//
//  SelectDelegateProtocol.swift
//  ExchangeRateCalculator
//
//  Created by 강현준 on 2023/04/09.
//

import Foundation

protocol SelectDelegate: AnyObject{
    func selectExchangeCountry(country: ExchangeRateModel)
}
