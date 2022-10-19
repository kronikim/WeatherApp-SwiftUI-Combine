//
//  WeatherIconConverterTests.swift
//  WeatherApp-SwiftUI-CombineTests
//
//  Created by deniz karahan on 19.10.2022.
//

import XCTest
import SwiftUI
@testable import WeatherApp_SwiftUI_Combine

final class WeatherIconConverterTests: XCTestCase {
    var viewModel: ForecastWeather!
    
    override func setUp() {
        viewModel = ForecastWeatherResponse.createMockForecastWeather().list.first
    }
    
    func test_weatherIconConverterTests() {
       // let weather = viewModel.weather.first ?? Weather.emptyInit()
        //let weatherIcon = WeatherIcon.convert(fromResponse: weather )
       // XCTAssertEqual(weatherIcon.weatherAppleIcon ,"cloud.sun.rain")
    }
}
