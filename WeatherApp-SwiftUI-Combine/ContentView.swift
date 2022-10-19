//
//  ContentView.swift
//  WeatherApp-SwiftUI-Combine
//
//  Created by deniz karahan on 19.10.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .weather
    
    enum Tab {
        case weather
        case onlineShopping
    }
    
    var body: some View {
        TabView(selection: $selection) {
            MainWeatherView()
                .tabItem {
                    Label("Weather", systemImage: "cloud.sun.rain.fill")
                }
                .tag(Tab.weather)
            
            OnlineShoppingView()
                .tabItem {
                    Label("Online Shopping", systemImage: "cart")
                }
                .tag(Tab.onlineShopping)
        }.onAppear() {
            UITabBar.appearance().isTranslucent = false
            UITabBar.appearance().backgroundColor = .systemBackground
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
