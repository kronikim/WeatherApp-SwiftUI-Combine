//
//  MockForecastWeatherBuilder.swift
//  WeatherApp-SwiftUI-Combine
//
//  Created by deniz karahan on 19.10.2022.
//

import Foundation

#if DEBUG
extension ForecastWeatherResponse {
  static func createMockForecastWeather() -> ForecastWeatherResponse {
    let path = Bundle.main.path(forResource: "MockForecastWeatherResponse", ofType: "json")!
    let url = URL(fileURLWithPath: path)
    let data = try! Data(contentsOf: url)
    let response = try! JSONDecoder().decode(ForecastWeatherResponse.self, from: data)
    return response
  }
}
#endif
