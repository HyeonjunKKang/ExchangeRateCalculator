//
//  ExchangeRateView.swift
//  ExchangeRateCalculator
//
//  Created by 강현준 on 2023/04/08.
//

import UIKit
import SnapKit

final class ExchangeRateView: UIView {
    
    var exchangeRateData: [ExchangeRateModel]?

    lazy var tableView: UITableView = {
        let tableview = UITableView()
        
        tableview.register(ExchangeTableViewCell.self, forCellReuseIdentifier: "ExchangeTableViewCell")
        tableview.dataSource = self
        
        return tableview
    }()
    
    let currencyNameLabel: UILabel = {
        let label = UILabel()
        label.text = "통화명"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    let salesBaseRate: UILabel = {
        let label = UILabel()
        label.text = "매매기준율"
        label.font = .systemFont(ofSize: 15, weight: .bold)

        return label
    }()
    
    let remittanceLabel: UILabel = {
        let label = UILabel()
        label.text = "보낼때"
        label.font = .systemFont(ofSize: 15, weight: .bold)

        return label
    }()
    
    let getLabel: UILabel = {
        let label = UILabel()
        label.text = "받을때"
        label.font = .systemFont(ofSize: 15, weight: .bold)

        return label
    }()
    
    lazy var remittanceGetStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [remittanceLabel, getLabel])
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private var lineView: UIView = {
        let line = UIView()
        line.backgroundColor = .gray
        line.translatesAutoresizingMaskIntoConstraints = false
        
        return line
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ExchangeRateView: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExchangeTableViewCell", for: indexPath) as? ExchangeTableViewCell else { return UITableViewCell()}
        
        if let data = exchangeRateData{
            cell.exchangeRateData = data[indexPath.row]
            cell.falgImage = ImageManager.shared.flagDataArray[data[indexPath.row].curUnit]
        }
        cell.selectionStyle = .none
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let data = exchangeRateData{
            return data.count
        }
        return 10
    }

}

private extension ExchangeRateView{
    
    func setLayout(){
        
        [
            tableView,
            currencyNameLabel,
            salesBaseRate,
            remittanceGetStackView,
            lineView
        ].forEach{ addSubview($0) }
        
        currencyNameLabel.snp.makeConstraints{
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            $0.leading.equalToSuperview().offset(90)
        }
        
        salesBaseRate.snp.makeConstraints{
            $0.centerY.equalTo(currencyNameLabel.snp.centerY)
            $0.leading.equalTo(currencyNameLabel.snp.trailing).offset(30)
        }
        
        remittanceGetStackView.snp.makeConstraints{
            $0.centerY.equalTo(currencyNameLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(30)
        }
        
        lineView.snp.makeConstraints{
            $0.top.equalTo(remittanceGetStackView.snp.bottom).offset(2)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(lineView.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    
}

