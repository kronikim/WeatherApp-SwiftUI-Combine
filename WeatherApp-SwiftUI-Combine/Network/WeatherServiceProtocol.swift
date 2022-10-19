//
//  WeatherServiceProtocol.swift
//  WeatherApp-SwiftUI-Combine
//
//  Created by deniz karahan on 19.10.2022.
//

import Foundation
import Combine

protocol WeatherServiceProtocol {
    func requestCurrentWeather() -> AnyPublisher<Data, Error>
    func requestForecastWeather() -> AnyPublisher<Data, Error>
}
