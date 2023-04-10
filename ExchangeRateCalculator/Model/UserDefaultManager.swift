//
//  UserDefaultManager.swift
//  ExchangeRateCalculator
//
//  Created by 강현준 on 2023/04/09.
//

import Foundation

final class UserDefaultManager{
    
    static var shared = UserDefaultManager()
    
    var interest: [String] = []
    
    func loadUserDefaults(){
        guard let data = UserDefaults.standard.value(forKey: "interest") as? Data,
              let interests = try? PropertyListDecoder().decode([String].self, from: data) else{ return }
        
        self.interest = interests
        
        print("UserDefault Update! list: \(interest)")
    }
    
    func addUserDefaults(_ curUnit: String, errHandler: () -> ()){
        if interest.contains(curUnit){
            errHandler()
            return
        }
        interest.append(curUnit)
        UserDefaults.standard.set(try? PropertyListEncoder().encode(self.interest), forKey: "interest")
        
        loadUserDefaults()
    }
    
    func deleteUserDefaults(_ curUnit: String){
        if let index = interest.firstIndex(of: curUnit){
            interest.remove(at: index)
        }
        UserDefaults.standard.set(try? PropertyListEncoder().encode(self.interest), forKey: "interest")
        loadUserDefaults()
    }
    private init(){
        loadUserDefaults()
    }
}
