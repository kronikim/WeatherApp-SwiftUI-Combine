//
//  MainWeatherView.swift
//  WeatherApp-SwiftUI-Combine
//
//  Created by deniz karahan on 19.10.2022.
//

import SwiftUI

struct MainWeatherView: View {
    @ObservedObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {
            WeatherBackgroundView()
            VStack {
                if weatherViewModel.stateModel  == .loading {
                    ActivityIndicator(isAnimating: .constant(true), style: .medium)
                }
              
                if weatherViewModel.stateModel  == .success {
                    TodayWeatherView(data: weatherViewModel.currentWeather)
                    Spacer()
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            Rectangle().frame(height: CGFloat(1))
                            HourlyForecastWeatherView(data: weatherViewModel.hourlyWeathers)
                            Spacer()
                            Rectangle().frame(height: CGFloat(1))
                            DailyForecastWeatherView(data: weatherViewModel.dailyWeathers)
                        
                            Rectangle().frame(height: CGFloat(1))
                        }
                    }
                    Spacer()
                }
                
                if weatherViewModel.stateModel == .failed {
                    Button(action: {
                        self.weatherViewModel.retry()
                    }) {
                        Text("Couldn't get data, please retry..")
                            .foregroundColor(.white)
                            .opacity(weatherViewModel.stateModel == .failed ? 1 : 0)
                    }
                }
            }
        }
        
    }
}

struct MainWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        MainWeatherView()
    }
}

