//
//  CurrentWeatherResponseModelTests.swift
//  WeatherApp-SwiftUI-CombineTests
//
//  Created by deniz karahan on 19.10.2022.
//

import XCTest
import SwiftUI
@testable import WeatherApp_SwiftUI_Combine

final class CurrentWeatherResponseModelTests: XCTestCase {
  var viewModel: CurrentWeatherResponse!
  
  override func setUp() {
      viewModel = CurrentWeatherResponse.createMockCurrentWeather()
  }
  
  func test_currentWeatherResponseModel() {
      XCTAssertEqual(viewModel.name, "Berlin")
      XCTAssertEqual(viewModel.id, 2950159)
      XCTAssertEqual(viewModel.main.temp, 16.2)
      XCTAssertEqual(viewModel.main.feelsLike, 16.36)
      XCTAssertEqual(viewModel.main.humidity, 95)
     
      XCTAssertEqual(viewModel.visibility, 10000)
      XCTAssertEqual(viewModel.clouds?.all, 75)
      XCTAssertEqual(viewModel.main.tempMin, 15.13)
      XCTAssertEqual(viewModel.main.tempMax, 17.21)
  }
}
