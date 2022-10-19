//
//  DailyForecastWeatherView.swift
//  WeatherApp-SwiftUI-Combine
//
//  Created by deniz karahan on 19.10.2022.
//

import SwiftUI

struct DailyForecastWeatherView: View {
    let data: [ForecastWeather]
    
    var body: some View {
        VStack {
            HStack {
                Spacer(minLength: 195)
                Text("Min").frame(alignment: .trailing)
                Spacer(minLength: 5)
                Text("Avg").frame(alignment: .trailing)
                Spacer()
                Text("Max")
                    .frame(alignment: .trailing)
            }.padding(.horizontal, 24)
            
            ForEach(data, id: \.date) { data in
                DailyForecastWeatherRow(data: data)
            }
        }
    }
}

struct DailyForecastWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastWeatherView(data: [ForecastWeather.emptyInit()])
    }
}
