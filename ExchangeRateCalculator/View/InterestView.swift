//
//  InterestView.swift
//  ExchangeRateCalculator
//
//  Created by 강현준 on 2023/04/08.
//

import UIKit
import SnapKit

final class InterestView: UIView {

    let referencedateLabel: UILabel = {
        let label =  UILabel()
        label.text = "0000-00-00 00:00:00기준"
        label.textAlignment = .center
        label.sizeToFit()
        label.textColor = .systemGray3
        
        return label
    }()
    
    lazy var interestTableView: UITableView = {
        let tableview = UITableView()
        
        tableview.register(InterestTableViewCell.self, forCellReuseIdentifier: "InterestTableViewCell")
        tableview.dataSource = self
        tableview.delegate = self
        
        return tableview
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension InterestView{
    
    func setLayout(){
        [
            referencedateLabel,
            interestTableView
        ].forEach{
            self.addSubview($0)
        }
        
        let labelInset: CGFloat = 3.0
        
        referencedateLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(labelInset)
            $0.trailing.equalToSuperview().inset(labelInset)
            $0.top.equalTo(self.safeAreaLayoutGuide)
        }
        
        interestTableView.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(referencedateLabel.snp.bottom)
            $0.bottom.equalToSuperview()
        }
    }
    
}


extension InterestView: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = interestTableView.dequeueReusableCell(withIdentifier: "InterestTableViewCell", for: indexPath) as? InterestTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
}

extension InterestView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // TODO: - 관심 항목 삭제 기능 구현
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
}
