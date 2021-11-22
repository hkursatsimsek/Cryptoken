//
//  CoinRepository.swift
//  Cryptoken
//
//  Created by Kürşat Şimşek on 19.11.2021.
//

import Foundation
import URLImage
import SwiftUI

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
    
    // TODO:
    func getImage(model: Coin, handler: @escaping (Image)->Image) {
        if let iconUrlString = model.iconUrl {
            if let imageUrl = URL(string: iconUrlString) {
                URLImage(imageUrl) { image in
                    handler(image
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .center)
                                .aspectRatio(contentMode: .fill) as! Image)
                    
                }
            }
        }
    }
    
    
}
