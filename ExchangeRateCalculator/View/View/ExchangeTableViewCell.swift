//
//  ExchangeTableViewCell.swift
//  ExchangeRateCalculator
//
//  Created by 강현준 on 2023/04/08.
//

import UIKit
import SnapKit

final class ExchangeTableViewCell: UITableViewCell {
    
    var exchangeRateData: ExchangeRateModel?{
        didSet{
            self.currencyName.text = exchangeRateData?.curUnit
            self.countryNameLabel.text = exchangeRateData?.countryName
            self.salesBaseRateLabel.text = exchangeRateData?.dealBasR
            self.remittanceLabel.text = exchangeRateData?.tts
            self.getLabel.text = exchangeRateData?.ttb
            
        }
    }
    
    
    

    private let countryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        
        return imageView
    }()
    
    private let currencyName: UILabel = {
        let label = UILabel()
        label.text = "USD"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        
        return label
    }()
    
    private let countryNameLabel: UILabel = {
        let label = UILabel()
        label.text = "미국"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        
        return label
    }()
    
    private lazy var countryStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [currencyName, countryNameLabel])
        stackView.axis = .vertical
        
        return stackView
    }()
    
    private let salesBaseRateLabel: UILabel = {
        let label = UILabel()
        label.text = "1319.00"
        
        return label
    }()
    
    // 보낼 때
    private let remittanceLabel: UILabel = {
        let label = UILabel()
        label.text = "1412.00(송금)"
        label.textColor = .systemBlue
        
        return label
    }()
    
    private let getLabel: UILabel = {
        let label = UILabel()
        label.text = "1400.00(수금)"
        label.textColor = .systemRed
        
        return label
    }()
    
    lazy var remittanceGetStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [remittanceLabel, getLabel])
        stackView.axis = .vertical
        
        return stackView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension ExchangeTableViewCell{
    func setLayout(){
        [
            countryImageView,
            countryStackView,
            salesBaseRateLabel,
            remittanceGetStackView
        ].forEach{
            self.addSubview($0)
        }
        
        countryImageView.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(10)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(40)
            $0.width.equalTo(60)
        }
        
        countryStackView.snp.makeConstraints{
            $0.leading.equalTo(countryImageView.snp.trailing).offset(30)
            $0.centerY.equalToSuperview()
        }

        
        remittanceGetStackView.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
        }
        
        salesBaseRateLabel.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-130)
            $0.centerY.equalToSuperview()
        }
        
    }
    
    
}
