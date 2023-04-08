//
//  CalculatorView.swift
//  ExchangeRateCalculator
//
//  Created by 강현준 on 2023/04/08.
//

import UIKit
import SnapKit

final class CalculatorView: UIView {

    private let buttonheight: CGFloat = (UIScreen.main.bounds.width / 3) + 3
    
    private lazy var leastheight: CGFloat = UIScreen.main.bounds.height - buttonheight
    
     let zeroButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("0", for: .normal)

        return button
    }()
    
     let oneButton: UIButton = {
        let button =  UIButton()
        button.setTitle("1", for: .normal)
        
        return button
    }()
    
     let twoButton: UIButton = {
        let button = UIButton()
        button.setTitle("2", for: .normal)
        
        return button
    }()
    
     let threeButton: UIButton = {
        let button = UIButton()
        button.setTitle("3", for: .normal)
        
        return button
    }()
    
     let fourButton: UIButton = {
        let button =  UIButton()
        button.setTitle("4", for: .normal)
        
        return button
    }()
    
      let fiveButton: UIButton = {
        let button =  UIButton()
        button.setTitle("5", for: .normal)
        
        return button
    }()
    
     let sixButton: UIButton = {
        let button =  UIButton()
        button.setTitle("6", for: .normal)
        
        return button
    }()
    
     let sevenButton: UIButton = {
        let button =  UIButton()
        button.setTitle("7", for: .normal)
        
        return button
    }()
    
     let eightButton: UIButton = {
        let button =  UIButton()
        button.setTitle("8", for: .normal)
        
        return button
    }()
    
    private let nineButton: UIButton = {
        let button =  UIButton()
        button.setTitle("9", for: .normal)
        
        return button
    }()
    
     let dotButton: UIButton = {
        let button =  UIButton()
        button.setTitle(".", for: .normal)
        
        return button
    }()
    
     let clearButton: UIButton = {
        let button =  UIButton()
        button.setTitle("Clear", for: .normal)
        
        return button
    }()
    
     let enterButton: UIButton = {
        let button =  UIButton()
        button.setTitle("Enter", for: .normal)
        
        return button
    }()
    
     let removeButton: UIButton = {
        let button =  UIButton()
        button.setImage(UIImage(systemName: "delete.left"), for: .normal)
        
        return button
    }()
    
    private lazy var horizontalStackView1: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [zeroButton, dotButton, enterButton])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private lazy var horizontalStackView2: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [oneButton, twoButton, threeButton])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private lazy var horizontalStackView3: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [fourButton, fiveButton, sixButton])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private lazy var horizontalStackView4: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sevenButton, eightButton, nineButton])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private lazy var resultStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [horizontalStackView4, horizontalStackView3, horizontalStackView2, horizontalStackView1])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        
        return stackView
    }()
    
    private var lineView: UIView = {
        let line = UIView()
        line.backgroundColor = .gray
        line.translatesAutoresizingMaskIntoConstraints = false
        
        return line
    }()
    
     let resultCountryLabel: UILabel = {
        let label = UILabel()
        label.text = "USD"
        
        return label
    }()
    
     let resultCountrySelectButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        
        return button
    }()
    
    let resultExchangeLabel: UILabel = {
        let label = UILabel()
        label.text = "0.0"
        
        return label
    }()
    
    private var lineView2: UIView = {
        let line = UIView()
        line.backgroundColor = .gray
        line.translatesAutoresizingMaskIntoConstraints = false
        
        return line
    }()
    
    let selectCountryLabel: UILabel = {
       let label = UILabel()
       label.text = "KR"
       
       return label
   }()
   
    let selectCountrySelectButton: UIButton = {
       let button = UIButton(type: .custom)
       button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
       
       return button
   }()
   
   let selectExchangeLabel: UILabel = {
       let label = UILabel()
       label.text = "0.0"
       
       return label
   }()
    
    private var lineView3: UIView = {
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

private extension CalculatorView{
    func setLayout(){
        
        
        [
            zeroButton,
            oneButton,
            twoButton,
            threeButton,
            fourButton,
            fiveButton,
            sixButton,
            sevenButton,
            eightButton,
            nineButton,
            dotButton,
            enterButton
        ].forEach{
            $0.backgroundColor = .white
            $0.setTitleColor(.black, for: .normal)
        }
        
        [
            resultStackView,
            lineView,
            resultExchangeLabel,
            resultCountryLabel,
            resultCountrySelectButton,
            lineView2,
            lineView3,
            resultCountryLabel,
            resultCountrySelectButton,
            resultExchangeLabel,
            selectCountryLabel,
            selectCountrySelectButton,
            selectExchangeLabel
            
        ].forEach{
            self.addSubview($0)
        }
        
        resultStackView.snp.makeConstraints{
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(buttonheight * 3)
        }
        
        lineView.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(CGFloat(1.0))
            $0.bottom.equalTo(resultStackView.snp.top)
        }
        
        lineView2.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(CGFloat(1.0))
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(buttonheight * 2 / 2)
        }
        
        lineView3.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(CGFloat(1.0))
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
        }
        
        resultCountryLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalTo(lineView.snp.top).inset(-50)
        }
        
        resultCountrySelectButton.snp.makeConstraints{
            $0.leading.equalTo(resultCountryLabel.snp.trailing)
            $0.centerY.equalTo(resultCountryLabel.snp.centerY)
        }
        
        resultExchangeLabel.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(lineView.snp.top).inset(-30)
        }
        
        selectCountryLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalTo(lineView2.snp.top).inset(-50)
        }
        
        selectCountrySelectButton.snp.makeConstraints{
            $0.leading.equalTo(resultCountryLabel.snp.trailing)
            $0.centerY.equalTo(resultCountryLabel.snp.centerY)
        }
        
        selectExchangeLabel.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(lineView2.snp.top).inset(-30)
        }
        
        
    }
}
