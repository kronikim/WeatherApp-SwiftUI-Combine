//
//  WeatherIcon.swift
//  WeatherApp-SwiftUI-Combine
//
//  Created by deniz karahan on 19.10.2022.
//

import Foundation
import SwiftUI

struct WeatherIcon {
    let id: Int
    let main, weatherDescription, icon: String
    var weatherAppleIcon: String? {
        switch icon {
        case "01d": return "sun.max"
        case "01n": return "moon"
        case "02d": return "cloud.sun"
        case "02n": return "cloud.moon"
        case "03d", "03n", "04d", "04n": return "cloud"
        case "09d", "09n": return "cloud.rain"
        case "10d": return "cloud.sun.rain"
        case "10n": return "cloud.moon.rain"
        case "11d", "11n": return "cloud.bolt.rain"
        case "13d", "13n": return "cloud.snow"
        case "50d", "50n": return "cloud.fog"
        default: return "sun.max"
        }
    }
    
    static func convert(fromResponse response: Weather) -> WeatherIcon {
        return WeatherIcon(id: response.id,
                main: response.main,
                weatherDescription: response.weatherDescription,
                icon: response.icon)
    }
}
