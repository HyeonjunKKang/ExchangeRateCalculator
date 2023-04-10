//
//  SelectCounturyViewController.swift
//  ExchangeRateCalculator
//
//  Created by 강현준 on 2023/04/09.
//

import UIKit
import SnapKit

final class SelectCounturyViewController: UIViewController{
    
    var exchangeRateModel: [ExchangeRateModel] = []
    
    weak var delegate: SelectDelegate?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(InterestTableViewCell.self, forCellReuseIdentifier:  "InterestTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }
    
    
    
}

extension SelectCounturyViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectExchangeCountry(country: exchangeRateModel[indexPath.row])
        self.navigationController?.popViewController(animated: true)
    }
}

extension SelectCounturyViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InterestTableViewCell", for: indexPath) as? InterestTableViewCell else { return UITableViewCell() }
        
        let data = exchangeRateModel[indexPath.row]
        cell.falgImage = ImageManager.shared.flagDataArray[data.curUnit]
        cell.exchangeRateData = data
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exchangeRateModel.count
    }
}

private extension SelectCounturyViewController{
    
    func setTableView(){
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
