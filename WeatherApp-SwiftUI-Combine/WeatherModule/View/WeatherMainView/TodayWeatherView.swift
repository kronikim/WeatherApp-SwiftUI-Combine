//
//  TodayWeatherView.swift
//  WeatherApp-SwiftUI-Combine
//
//  Created by deniz karahan on 19.10.2022.
//

import SwiftUI

struct TodayWeatherView: View {
    let data: CurrentWeatherResponse

    var weatherName: String {
        var result = ""
        if let weather = data.weather.first {
            result = weather.weatherDescription.capitalizingFirstLetter()
        }
        return result
    }
    
    var temperature: String {
        return "\(Int(data.main.temp))°"
    }
    var humidity: String {
        return "\(Int(data.main.humidity))°"
    }
    var feelsLike: String {
        return "\(Int(data.main.feelsLike))°"
    }

    var body: some View {
        VStack {
            Text(data.name)
                .font(.largeTitle)
                .fontWeight(.medium)
         
            Text(temperature)
                .font(.system(size: 86))
                .fontWeight(.thin)
            
            Text(weatherName)
                .font(.body)
                .fontWeight(.light)
                .padding(.bottom, 4)
            HStack {
                HStack {
                    Text("H:")
                        .font(.body)
                        .fontWeight(.light)
                        .padding(.bottom, 4)
                    Text(humidity)
                        .font(.body)
                        .fontWeight(.light)
                        .padding(.bottom, 4)
                    
                }
                HStack {
                    Text("L:")
                        .font(.body)
                        .fontWeight(.light)
                        .padding(.bottom, 4)
                    Text(feelsLike)
                        .font(.body)
                        .fontWeight(.light)
                        .padding(.bottom, 4)
                    
                }
                
            }
            
        }
        .padding(.vertical, 24)
    }
}

struct TodayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        TodayWeatherView(data: CurrentWeatherResponse.emptyInit())
    }
}
