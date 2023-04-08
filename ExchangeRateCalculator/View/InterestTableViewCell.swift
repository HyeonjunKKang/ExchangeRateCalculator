//
//  InterestTableViewCell.swift
//  ExchangeRateCalculator
//
//  Created by 강현준 on 2023/04/08.
//

import UIKit
import SnapKit

final class InterestTableViewCell: UITableViewCell {
    
    private lazy var countryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        
        return imageView
    }()
    
    private let countryNameLabel: UILabel = {
        let label = UILabel()
        label.text = "중국"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        
        return label
    }()
    
    private let sellValueLabel: UILabel = {
        let label = UILabel()
        label.text = "1232.1"
        label.font = .systemFont(ofSize: 16)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
}

private extension InterestTableViewCell{
     func setLayout(){
        [
            countryImageView,
            countryNameLabel,
            sellValueLabel
            
        ].forEach{ self.addSubview($0) }
        
        let margin: CGFloat = 15
        
        countryImageView.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(margin)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(90)
            $0.height.equalTo(60)
        }
        
        countryNameLabel.snp.makeConstraints{
            $0.leading.equalTo(countryImageView.snp.trailing).offset(margin)
            $0.centerY.equalTo(countryImageView)
        }
        
        sellValueLabel.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(margin)
            $0.centerY.equalTo(countryImageView.snp.centerY)
        }
        
    }
}
