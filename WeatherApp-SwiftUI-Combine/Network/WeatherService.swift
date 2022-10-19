//
//  WeatherService.swift
//  WeatherApp-SwiftUI-Combine
//
//  Created by deniz karahan on 19.10.2022.
//

import Foundation
import CoreLocation
import Combine

class WeatherService: WeatherServiceProtocol {
    private let apiProvider = NetworkProvider<WeatherEndpoint>()

    func requestCurrentWeather() -> AnyPublisher<Data, Error> {
        return apiProvider.getData(
            from: .getCurrentWeather(cityId: "2950159")
        )
            .eraseToAnyPublisher()
    }
    
    func requestForecastWeather() -> AnyPublisher<Data, Error> {
        return apiProvider.getData(
            from: .getForecastWeather(cityId: "2950159")
        )
            .eraseToAnyPublisher()
    }
    
}

