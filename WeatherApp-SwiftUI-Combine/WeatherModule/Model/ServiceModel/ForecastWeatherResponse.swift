//
//  ForecastWeatherResponse.swift
//  WeatherApp-SwiftUI-Combine
//
//  Created by deniz karahan on 19.10.2022.
//

import Foundation

struct ForecastWeatherResponse: Codable {
    let cod: String
    let message, cnt: Int
    let list: [ForecastWeather]
    let city: ForecastWeatherCity
    
    static func emptyInit() -> ForecastWeatherResponse {
        return ForecastWeatherResponse(
            cod: "",
            message: 0,
            cnt: 0,
            list: [],
            city: ForecastWeatherCity.emptyInit()
        )
    }
    
    
    var dailyList: [ForecastWeather] {
        var result: [ForecastWeather] = []
        guard var beforeDay = list.first else {
            return result
        }
        
        if beforeDay.date.dateFromMilliseconds().dayWord() != Date().dayWord() {
            result.append(beforeDay)
        }

        for weather in list {
            if weather.date.dateFromMilliseconds().dayWord() != beforeDay.date.dateFromMilliseconds().dayWord() {
                result.append(weather)
            }
            beforeDay = weather
        }

        return result
    }
}


// MARK: - City
struct ForecastWeatherCity: Codable {
    let id: Int
    let name: String
    let coordinate: Coordinate
    let country: String
    let population, timezone, sunrise, sunset: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case coordinate = "coord"
        case country,population, timezone, sunrise, sunset
    }
    
    static func emptyInit() -> ForecastWeatherCity {
        return ForecastWeatherCity(
            id: 0,
            name: "",
            coordinate: Coordinate.emptyInit(),
            country: "",
            population: 0,
            timezone: 0,
            sunrise: 0,
            sunset: 0
        )
    }
}

// MARK: - List
struct ForecastWeather: Codable {
    let date: Int
    let main: ForecastWeatherMainValue
    let weather: [Weather]
    let clouds: Clouds?
    let wind: Wind?
    let visibility: Int
    let pop: Double
    let dtTxt: String
    let rain: Rain?

    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case main, weather, clouds, wind, visibility, pop //, sys
        case dtTxt = "dt_txt"
        case rain
    }
    
    static func emptyInit() -> ForecastWeather {
        return ForecastWeather(
            date: 0,
            main: ForecastWeatherMainValue.emptyInit(),
            weather: [],
            clouds: Clouds.emptyInit(),
            wind: Wind.emptyInit(),
            visibility: 0,
            pop: 0.0,
            dtTxt: "",
            rain: Rain.emptyInit())
    }
}

extension ForecastWeather: Identifiable {
    var id: String { "\(date)" }
}

// MARK: - MainClass
struct ForecastWeatherMainValue: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
    static func emptyInit() -> ForecastWeatherMainValue {
        return ForecastWeatherMainValue(
            temp: 0.0,
            feelsLike: 0.0,
            tempMin: 0.0,
            tempMax: 0.9,
            pressure: 0,
            seaLevel: 0,
            grndLevel: 0,
            humidity: 0,
            tempKf: 0
        )
    }
}
