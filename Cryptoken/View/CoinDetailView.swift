//
//  CoinDetailView.swift
//  Cryptoken
//
//  Created by Kürşat Şimşek on 22.11.2021.
//

import SwiftUI

struct CoinDetailView: View {
    
    var coins : Coin
    
    var body: some View {
        VStack{
            if let name = coins.name, let price = coins.price {
                Text(name)
                Text(price)
            }
        }
    }
}
