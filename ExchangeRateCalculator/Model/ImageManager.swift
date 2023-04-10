//
//  ImageManager.swift
//  ExchangeRateCalculator
//
//  Created by 강현준 on 2023/04/09.
//

import Foundation
import UIKit

final class ImageManager{
    static let shared = ImageManager()
    var flagDataArray: [String: UIImage] = [:]
    
    private init(){
        makeFlagData()
    }
    
    func makeFlagData(){
        flagDataArray["AED", default: UIImage()] = UIImage(named: "AE.png") ?? UIImage()
        flagDataArray["AUD", default: UIImage()] = UIImage(named: "AU.png") ?? UIImage()
        flagDataArray["BHD", default: UIImage()] = UIImage(named: "BH.png") ?? UIImage()
        flagDataArray["BND", default: UIImage()] = UIImage(named: "BN.png") ?? UIImage()
        flagDataArray["CAD", default: UIImage()] = UIImage(named: "CA.png") ?? UIImage()
        flagDataArray["CHF", default: UIImage()] = UIImage(named: "CH.png") ?? UIImage()
        flagDataArray["CNH", default: UIImage()] = UIImage(named: "CN.png") ?? UIImage()
        flagDataArray["DKK", default: UIImage()] = UIImage(named: "DK.png") ?? UIImage()
        flagDataArray["EUR", default: UIImage()] = UIImage(named: "EU.png") ?? UIImage()
        flagDataArray["GBP", default: UIImage()] = UIImage(named: "GB.png") ?? UIImage()
        flagDataArray["HKD", default: UIImage()] = UIImage(named: "HK.png") ?? UIImage()
        flagDataArray["IDR(100)", default: UIImage()] = UIImage(named: "ID.png") ?? UIImage()
        flagDataArray["JPY(100)", default: UIImage()] = UIImage(named: "JP.png") ?? UIImage()
        flagDataArray["KRW", default: UIImage()] = UIImage(named: "KO.png") ?? UIImage()
        flagDataArray["KWD", default: UIImage()] = UIImage(named: "KW.png") ?? UIImage()
        flagDataArray["MYR", default: UIImage()] = UIImage(named: "MY.png") ?? UIImage()
        flagDataArray["NOK", default: UIImage()] = UIImage(named: "NO.png") ?? UIImage()
        flagDataArray["NZD", default: UIImage()] = UIImage(named: "NZ.png") ?? UIImage()
        flagDataArray["SAR", default: UIImage()] = UIImage(named: "SA.png") ?? UIImage()
        flagDataArray["SEK", default: UIImage()] = UIImage(named: "SE.png") ?? UIImage()
        flagDataArray["SGD", default: UIImage()] = UIImage(named: "SG.png") ?? UIImage()
        flagDataArray["THB", default: UIImage()] = UIImage(named: "TH.png") ?? UIImage()
        flagDataArray["USD", default: UIImage()] = UIImage(named: "US.png") ?? UIImage()
    }
    
    
}
