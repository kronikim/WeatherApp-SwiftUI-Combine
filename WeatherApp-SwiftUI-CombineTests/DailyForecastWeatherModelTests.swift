//
//  DailyForecastWeatherModelTests.swift
//  WeatherApp-SwiftUI-CombineTests
//
//  Created by deniz karahan on 19.10.2022.
//

import XCTest
import SwiftUI
@testable import WeatherApp_SwiftUI_Combine

final class DailyForecastWeatherModelTests: XCTestCase {
  var viewModel: ForecastWeather!
  
  override func setUp() {
      viewModel = ForecastWeatherResponse.createMockForecastWeather().list.first
  }

  func test_dailyForecastWeatherModel() {
      XCTAssertEqual(viewModel.date.dateFromMilliseconds().dayWord(), "Tuesday")
      XCTAssertEqual(viewModel.main.temp, 16.2)
      XCTAssertEqual(viewModel.main.tempMin, 15.93)
      XCTAssertEqual(viewModel.main.tempMax, 16.2)
      
      XCTAssertEqual(viewModel.date, 1666105200)
      XCTAssertEqual(viewModel.visibility, 10000)
      XCTAssertEqual(viewModel.wind?.speed, 3.37)
      XCTAssertEqual(viewModel.clouds?.all, 75)
      XCTAssertEqual(viewModel.main.temp, 16.2)
      XCTAssertEqual(viewModel.main.feelsLike, 16.36)
      XCTAssertEqual(viewModel.main.humidity, 95)
      XCTAssertEqual(viewModel.weather.first?.main, "Rain")
  }
}
