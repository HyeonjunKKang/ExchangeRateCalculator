//
//  InterestViewController.swift
//  ExchangeRateCalculator
//
//  Created by 강현준 on 2023/04/08.
//

import UIKit
import SnapKit

final class InterestViewController: UIViewController{
    let interestView = InterestView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()

    }
    
    override func loadView() {
        self.view = interestView
    }
    
}


extension InterestViewController{
    // 뷰 컨트롤러 설정
    func setUpNavigationBar(){
        navigationItem.title = "관심 환율"
        self.navigationController?.navigationBar.backgroundColor = .systemBackground
        self.navigationItem.largeTitleDisplayMode = .always
    }
}


