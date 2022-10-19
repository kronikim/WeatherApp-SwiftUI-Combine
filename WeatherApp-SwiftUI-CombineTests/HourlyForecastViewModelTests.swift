//
//  HourlyForecastViewModelTests.swift
//  WeatherApp-SwiftUI-CombineTests
//
//  Created by deniz karahan on 17.10.2022.
//

import XCTest
import SwiftUI
@testable import WeatherApp_SwiftUI_Combine
final class HourlyForecastViewModelTests: XCTestCase {
  var viewModel: ForecastWeather!
  
  override func setUp() {
      viewModel = ForecastWeatherResponse.createMockForecastWeather().list.first
  }

  func test_hourlyForecastViewModel() {
      XCTAssertEqual(viewModel.main.temp, 16.2)
      XCTAssertEqual(viewModel.date.dateFromMilliseconds().hourMinute(), "18.00")
      
     /* let weather = viewModel.weather.first ?? Weather.emptyInit()
      let weatherIcon = WeatherIcon.convert(fromResponse: weather )
      XCTAssertEqual(weatherIcon.weatherAppleIcon ,"cloud.sun.rain")*/
  }
}
