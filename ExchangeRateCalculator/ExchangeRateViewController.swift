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
        exchangeRateView.tableView.delegate = self
        
        exchangeRateView.exchangeRateData = networkManager.exchangeRateModel.rateData
    }
}

extension ExchangeRateViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "관심", message: "관심항목에 추가하시겠습니까?", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "추가", style: .default) { [weak self]_ in
            if let data = self?.networkManager.exchangeRateModel.rateData{
                
                UserDefaultManager.shared.addUserDefaults(data[indexPath.row].curUnit) {
                    let cancleAlertController = UIAlertController(title: "오류", message: "이미 관심 항목에 추가되었습니다", preferredStyle: .alert)
                    let cancleAction = UIAlertAction(title: "취소", style: .cancel)
                    cancleAlertController.addAction(cancleAction)
                    self?.present(cancleAlertController, animated: true)
                }
            }
        }
        let cancleAction = UIAlertAction(title: "취소", style: .cancel)
        
        alertController.addAction(addAction)
        alertController.addAction(cancleAction)
        
        self.present(alertController, animated: true)
    }
}

private extension ExchangeRateViewController{
    func setNavigationBar(){
        self.title = "\(networkManager.exchangeRateModel.basedDate) \(networkManager.exchangeRateModel.basedTime)기준"
    }
}
