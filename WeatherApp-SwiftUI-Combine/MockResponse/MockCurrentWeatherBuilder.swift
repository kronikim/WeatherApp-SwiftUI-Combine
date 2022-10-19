//
//  MockCurrentWeatherBuilder.swift
//  WeatherApp-SwiftUI-Combine
//
//  Created by deniz karahan on 19.10.2022.
//

import Foundation

#if DEBUG
extension CurrentWeatherResponse {
  static func createMockCurrentWeather() -> CurrentWeatherResponse {
    let path = Bundle.main.path(forResource: "MockCurrentWeatherResponse", ofType: "json")!
    let url = URL(fileURLWithPath: path)
    let data = try! Data(contentsOf: url)
    let response = try! JSONDecoder().decode(CurrentWeatherResponse.self, from: data)
    return response
  }
}
#endif
