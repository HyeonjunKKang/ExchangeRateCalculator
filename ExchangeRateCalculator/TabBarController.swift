//
//  TabBarController.swift
//  ExchangeRateCalculator
//
//  Created by 강현준 on 2023/04/08.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        setTabBarController()
        setUpTabbarStyle()
    }
    
}

private extension TabBarController{
    
    func setView(){
        self.view.backgroundColor = .systemBackground
    }
    
    func setTabBarController(){
        
        let interestViewController = UINavigationController(rootViewController: InterestViewController())
        interestViewController.tabBarItem = UITabBarItem(title: "관심", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star"))
        
        let calculatorViewController = UINavigationController(rootViewController: CalculatorViewController())
        calculatorViewController.tabBarItem = UITabBarItem(title: "계산기", image: UIImage(systemName: "candybarphone"), selectedImage: UIImage(systemName: "candybarphone"))
        
        let exchangerateViewController = UINavigationController(rootViewController: ExchangeRateViewController())
        exchangerateViewController.tabBarItem = UITabBarItem(title: "환율", image: UIImage(systemName: "dollarsign.arrow.circlepath"), selectedImage: UIImage(systemName: "dollarsign.arrow.circlepath"))
        
        viewControllers = [interestViewController, calculatorViewController, exchangerateViewController]
    }
    
    func setUpTabbarStyle(){
        UITabBar.clearShadow()
        tabBar.layer.applyShadow(color: .gray, alpha: 0.3, x: 0, y: 0, blur: 12)
    }
}

