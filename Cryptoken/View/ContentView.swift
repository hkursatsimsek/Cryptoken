//
//  ContentView.swift
//  Cryptoken
//
//  Created by Kürşat Şimşek on 19.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    var coinRepository = CoinRepository()
    @State var coins = [Coin]()
    
    var body: some View {
        List(coins, id:\.uuid) { coin in
            Text(coin.name)
        }.navigationTitle("Coins")
            .onAppear() {
                coinRepository.getAllCoins { result in
                    coins = result
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
