//
//  MainView.swift
//  Cryptoken
//
//  Created by Kürşat Şimşek on 22.11.2021.
//

import SwiftUI
import URLImage

struct MainView: View {
    
    var coinRepository = CoinRepository()
    @State var coins = [Coin]()
    
    var body: some View {
        NavigationView {
            List(coins,id: \.uuid) { item in
                NavigationLink {
                    CoinDetailView(coins: item)
                } label: {
                    HStack{
                        if let iconUrlString = item.iconUrl {
                            if let imageUrl = URL(string: "https://cdn.coinranking.com/Sy33Krudb/btc.png") {
                                URLImage(imageUrl) { image in
                                    image
                                        .resizable()
                                        .frame(width: 30, height: 30, alignment: .center)
                                        .aspectRatio(contentMode: .fill)

                                }
                            }
                        }
                        Text(item.name ?? "")
                    }
                    
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image("coin")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("Coins").font(.largeTitle).padding()
                    }
                    
                }
            }
        }.onAppear(){
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
