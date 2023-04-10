//
//  InterestViewController.swift
//  ExchangeRateCalculator
//
//  Created by 강현준 on 2023/04/08.
//

import UIKit
import SnapKit

final class InterestViewController: UIViewController{
    
    let networkManager = NetworkManagerModel.shared
    
    let interestView = InterestView()
    
    var interestedData: [ExchangeRateModel] = []

    override func loadView() {
        self.view = interestView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()
        
        filteringData()
        
        interestView.exchangeRateData = interestedData
        interestView.interestTableView.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        filteringData()
        interestView.interestTableView.reloadData()
    }
    
    
    func filteringData(){
        interestedData = networkManager.exchangeRateModel.rateData.filter{
            UserDefaultManager.shared.loadUserDefaults()
            return UserDefaultManager.shared.interest.contains($0.curUnit)
        }
        interestView.exchangeRateData = []
        interestView.exchangeRateData = interestedData
        
    }
}

extension InterestViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertController = UIAlertController(title: "관심항목", message: "관심항목을 삭제하시겠습니까?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "삭제", style: .default) { [weak self] _ in
            
            guard let self = self else { return }
            let willRemoveData = self.interestedData[indexPath.row]
            UserDefaultManager.shared.deleteUserDefaults(willRemoveData.curUnit)
            self.filteringData()
            tableView.reloadData()
        }
        
        let cancleAction = UIAlertAction(title: "취소", style: .cancel)
        
        alertController.addAction(okAction)
        alertController.addAction(cancleAction)
        
        present(alertController, animated: true)
    }
}

private extension InterestViewController{
    // 뷰 컨트롤러 설정
    func setUpNavigationBar(){
        navigationItem.title = "관심 환율"
        self.navigationController?.navigationBar.backgroundColor = .systemBackground
        self.navigationItem.largeTitleDisplayMode = .always
        
        interestView.referencedateLabel.text = "\(networkManager.exchangeRateModel.basedDate) \(networkManager.exchangeRateModel.basedTime)기준"
    }
}


