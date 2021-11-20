//
//  CoinRepository.swift
//  Cryptoken
//
//  Created by Kürşat Şimşek on 19.11.2021.
//

import Foundation

class CoinRepository {
    
    
    func getAllCoins(completionHandler: @escaping (RequestModel)->Void) {
        
        guard let url = URL(string: Environment.baseUrl().absoluteString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let coindData = data {
                do {
                    let decodedData = try JSONDecoder().decode(RequestModel.self, from: coindData)
                    completionHandler(decodedData)
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }.resume()
        
        
    }
    
    
}
