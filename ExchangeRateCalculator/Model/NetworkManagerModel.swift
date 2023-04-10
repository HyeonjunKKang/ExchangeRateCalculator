//
//  FetchData.swift
//  ExchangeRateCalculator
//
//  Created by 강현준 on 2023/04/08.
//

import UIKit
import Alamofire

final class NetworkManagerModel: NetworkManagerProtocol{
    
    static let shared = NetworkManagerModel()
    var exchangeRateModel =  ResultData()
    
    let date = Date()
    let formatter = DateFormatter()
    
    private init(){}
   
    // 재귀함수 > 날짜를 바꿔가며 데이터 읽어오기를 시도한다.
    func fetchData(date: Date = Date() + 86400, count: Int = 0, completion: (([ExchangeRateModel]?) -> ())? = nil){
        guard let path = Bundle.main.url(forResource: "Data", withExtension: "plist") else { return }
        
        guard let dictionary = NSDictionary(contentsOf: path) else { return }
        
        let urlString = "https://www.koreaexim.go.kr/site/program/financial/exchangeJSON"
        let key = dictionary["Key"] as? String ?? ""
        
        
        var dateString = date
        dateString -= 86400
        formatter.dateFormat = "yyyyMMdd"
        let convertDate = formatter.string(from: dateString)
        
        formatter.dateFormat = "hh:mm:ss"
        let convertTime = formatter.string(from: dateString)

        let param = [
            "authkey": key,
            "data" : "AP01",
            "searchdate": convertDate
        ]

        let _ = AF.request(urlString, method: .get, parameters: param, headers: nil).responseData { [weak self] response in
            switch response.result{
            case .failure(let error):
                print(error.errorDescription ?? "")
                
            case .success(let data):

                guard let rateData = self?.decoder(data: data, model: [ExchangeRateModel].self) else {
                    
                    // 재귀함수로 구현
                    if count < 5{
                        self?.fetchData(date: dateString, count: count + 1)
                    }else{
                        print("작업 불가")
                    }
                    return
                }
                
                
                self?.exchangeRateModel.rateData = rateData
                self?.exchangeRateModel.basedDate = convertDate
                self?.exchangeRateModel.basedTime = convertTime
                
                
                if let empty = self?.exchangeRateModel.rateData.isEmpty, empty == true{
                    if count < 5{
                        self?.fetchData(date: dateString, count: count + 1)
                    }else{
                        print("작업 불가")
                    }
                }
                
                print(self?.exchangeRateModel)
                
                if let handler = completion{
                    handler(self?.exchangeRateModel.rateData)
                }
            }
        }.resume()
    }
    
    private func decoder<T: Decodable>(data: Data, model: T.Type) -> T?{
        return try? JSONDecoder().decode(model, from: data)
    }
   
}
