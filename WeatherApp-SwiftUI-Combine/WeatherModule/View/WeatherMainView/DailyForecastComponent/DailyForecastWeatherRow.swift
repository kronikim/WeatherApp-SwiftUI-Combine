//
//  DailyForecastWeatherRow.swift
//  WeatherApp-SwiftUI-Combine
//
//  Created by deniz karahan on 19.10.2022.
//

import SwiftUI

struct DailyForecastWeatherRow: View {
    let data: ForecastWeather
 
    var day: String {
        return data.date.dateFromMilliseconds().dayWord()
    }
    
    var temperatureMin: String {
        return "\(Int(data.main.tempMin))°"
    }
    
    var temperatureAverage: String {
        return "\(Int(data.main.temp))°"
    }
    
    var temperatureMax: String {
        return "\(Int(data.main.tempMax))°"
    }

    var icon: String {
        var image = "cloud.sun.rain.fill"
        if let weather = data.weather.first {
            let iconNew = WeatherIcon.convert(fromResponse: weather)
            image = iconNew.weatherAppleIcon ?? "sun.max"
        }
        return image
    }

    var body: some View {
        HStack {
            Text(day)
                .frame(width: 120, alignment: .leading)
            
            Image(uiImage: UIImage(systemName: icon)!)
                .fixedSize()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)

            Spacer()
            
            Text(temperatureMin).frame(alignment: .trailing)
            Spacer()
    
            Text(temperatureAverage).frame(alignment: .trailing)
            Spacer()
  
            Text(temperatureMax).frame(alignment: .trailing)
        }.padding(.horizontal, 24)
    }


}

struct DailyForecastWeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastWeatherRow(data: ForecastWeather.emptyInit())
    }
}
