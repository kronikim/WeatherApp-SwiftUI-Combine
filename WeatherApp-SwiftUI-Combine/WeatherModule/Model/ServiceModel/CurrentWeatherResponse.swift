//
//  CurrentWeatherResponse.swift
//  WeatherApp-SwiftUI-Combine
//
//  Created by deniz karahan on 19.10.2022.
//

import Foundation

struct CurrentWeatherResponse: Codable {
    //let coord: Coordinate
    let weather: [Weather]
    let base: String
    let main: CurrentWeatherMainValue
    let visibility: Int
    let wind: Wind?
    let clouds: Clouds?
    let dt: Int
   // let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
    
    static func emptyInit() -> CurrentWeatherResponse {
        return CurrentWeatherResponse(
           // coord: Coordinate.emptyInit(),
            weather: [],
            base: "",
            main: CurrentWeatherMainValue.emptyInit(),
            visibility: 0,
            wind: Wind.emptyInit(),
            clouds: Clouds.emptyInit(),
            dt: 0,
           // sys: Sys.emptyInit(),
            timezone: 0,
            id: 0,
            name: "",
            cod: 0)
    }
    
    func IsEmpty() -> Bool {
        return id == 0 ? true : false
    }
}

// MARK: - Coord
struct Coordinate: Codable {
    let lon, lat: Double
    
    static func emptyInit() -> Coordinate {
        return Coordinate(lon: 0, lat: 0)
    }
}

struct Clouds: Codable {
    let all: Int
    
    static func emptyInit() -> Clouds {
        return Clouds(all: 0)
    }
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
    
    static func emptyInit() -> Wind {
        return Wind(speed: 0.0, deg: 0)
    }
}

struct Snow: Codable {
    let snow1h: Int
    let snow3h: Int
    
    enum CodingKeys: String, CodingKey {
        case snow1h = "snow.1h"
        case snow3h = "snow.3h"
    }
}

struct Rain: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
    static func emptyInit() -> Rain {
        return Rain(the3H: 0.0)
    }
}

struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
    static func emptyInit() -> Sys {
        return Sys(type: 0, id: 0, country: "", sunrise: 0, sunset: 0)
    }
}
