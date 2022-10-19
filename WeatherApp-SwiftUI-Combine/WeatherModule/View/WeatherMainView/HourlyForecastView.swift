//
//  HourlyForecastView.swift
//  WeatherApp-SwiftUI-Combine
//
//  Created by deniz karahan on 19.10.2022.
//

import SwiftUI

struct HourlyForecastWeatherView: View {
    let data: [ForecastWeather]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(data) { data in
                    HourlyForecastWeatherCell(data: data)
                    Spacer().frame(width: 24)
                }
            }.padding(.horizontal, 24)
        }
    }
}

struct HourlyForecastWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastWeatherView(data: [ForecastWeather.emptyInit()])
    }
}

