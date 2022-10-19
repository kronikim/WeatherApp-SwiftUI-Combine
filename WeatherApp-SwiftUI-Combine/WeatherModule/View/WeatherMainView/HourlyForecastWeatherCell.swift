//
//  HourlyForecastWeatherCell.swift
//  WeatherApp-SwiftUI-Combine
//
//  Created by deniz karahan on 19.10.2022.
//

import SwiftUI

struct HourlyForecastWeatherCell: View {
    var data: ForecastWeather

    var hour: String {
        return data.date.dateFromMilliseconds().hourMinute()
    }

    var temperature: String {
        return "\(Int(data.main.temp))°"
    }

    var icon: String {
        var image = "sun.max"
        if let weather = data.weather.first {
            let iconNew = WeatherIcon.convert(fromResponse: weather)
            image = iconNew.weatherAppleIcon ?? "sun.max"
        }
        return image
    }

    var body: some View {
        VStack {
            Text(hour)
    
            Image(uiImage: UIImage(systemName: icon)!)
                .fixedSize()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            
            Text(temperature)
        }.padding(.all, 0)
    }
}

struct HourlyForecastWeatherCell_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastWeatherCell(data: ForecastWeather.emptyInit())
    }
}
