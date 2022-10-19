//
//  WeatherEndpoint.swift
//  WeatherApp-SwiftUI-Combine
//
//  Created by deniz karahan on 19.10.2022.
//

import Foundation

enum WeatherEndpoint: EndpointProtocol {
    case getCurrentWeather(cityId: String)
    case getForecastWeather(cityId: String)
    
    enum EndpointType: String {
        case currentWeather = "weather"
        case forecastWeather = "forecast"
    }
    
    var absoluteURL : String{
        let apiKey = "6e7cb195d079d59711614a4a5973e61a"
        switch self {
            case let .getCurrentWeather(cityId):
                return  "https://api.openweathermap.org/data/2.5/\(EndpointType.currentWeather.rawValue)?APPID=\(apiKey)&units=metric&id=\(cityId)"
            case let .getForecastWeather(cityId):
                return "https://api.openweathermap.org/data/2.5/\(EndpointType.forecastWeather.rawValue)?APPID=\(apiKey)&units=metric&id=\(cityId)"
        }
    }
  
    var httpMethod: HTTPMethod {
        return .get
    }

    var headers: [String : String] {
        return [
            "Content-type": "application/json",
            "Accept": "application/json"
        ]
    }
 }

