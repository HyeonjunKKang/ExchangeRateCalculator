//
//  ExchangeRateModel.swift
//  ExchangeRateCalculator
//
//  Created by 강현준 on 2023/04/08.
//

import Foundation

struct ResultData{
    var basedDate = ""
    var basedTime = ""
    
    var rateData: [ExchangeRateModel] = []
    

}

struct ExchangeRateModel: Codable {
    let result: Int
    let curUnit: String
    let ttb: String
    let tts: String
    let dealBasR: String
    let curNm: String
    
    var countryName: String?{
        get{
            
            switch curNm{
            case "위안화":
                return "중국"
            default: break
            }
            
            return self.curNm.components(separatedBy: " ")[0]
        }
    }

    enum CodingKeys: String, CodingKey {
        case result                 // 조회 결과, 1: 성공, 2: DATA코드오류, 3. 인증코드오류, 4. 일일제한횟수마감
        case curUnit = "cur_unit"  // 통화코드
        case ttb                    // 받을 때
        case tts                    // 보낼 때
        case dealBasR = "deal_bas_r"    // 매매 기준율
        case curNm = "cur_nm"       // 국가/통화명
    }
}
