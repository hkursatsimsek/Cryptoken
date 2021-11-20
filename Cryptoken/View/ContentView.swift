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
        VStack{
            List(coins,id: \.uuid) { item in
                Text(item.name ?? "Noname")
            }.navigationTitle("Coins")
                .onAppear(){
                    coinRepository.getAllCoins { result in
                        if let coinData = result.data {
                            if let myCoins = coinData.coins {
                                coins = myCoins
                            }
                        }
                        
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
