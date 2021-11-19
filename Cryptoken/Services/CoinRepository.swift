//
//  CoinRepository.swift
//  Cryptoken
//
//  Created by Kürşat Şimşek on 19.11.2021.
//

import Foundation

class CoinRepository {
    
    
    func getAllCoins(completionHandler: @escaping ([Coin])->Void) {
        
        guard let url = URL(string: "https://api.coinranking.com/v2/coins") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let coindData = data {
                do {
                    let decodedData = try JSONDecoder().decode([Coin].self, from: coindData)
                    completionHandler(decodedData)
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }.resume()
        
        
    }
    
    
}
