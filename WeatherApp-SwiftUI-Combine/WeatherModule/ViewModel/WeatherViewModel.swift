//
//  WeatherViewModel.swift
//  WeatherApp-SwiftUI-Combine
//
//  Created by deniz karahan on 19.10.2022.
//

import SwiftUI
import Combine

final class WeatherViewModel: ObservableObject {
    private let weatherService: WeatherServiceProtocol = WeatherService()
    private var bag = Set<AnyCancellable>()
    
    @Published private (set) var currentWeather : CurrentWeatherResponse = CurrentWeatherResponse.emptyInit()
    @Published private (set) var dailyWeathers : [ForecastWeather] = []
    @Published private (set) var hourlyWeathers : [ForecastWeather] = []
    @Published private (set) var forecastWeatherRes: ForecastWeatherResponse?
    
    private var stateCurrentWeather = StateModel.loading{
        didSet {
            updateStateModel()
        }
    }
    
    private var stateForecastWeather = StateModel.loading{
        didSet {
            updateStateModel()
        }
    }
    
    var stateModel: StateModel = StateModel.loading {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
      //  getDataFromJson()
        getCurrentWeather()
        requestForecastWeather()
    }
    
    private func getCurrentWeather() {
        weatherService.requestCurrentWeather()
            .decode(type: CurrentWeatherResponse.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(
                receiveCompletion: { [weak self] _ in
                   // self?.stateCurrentWeather = .failed
                },
                receiveValue: { [weak self] weather in
                    self?.currentWeather = weather
                    self?.stateCurrentWeather = .success
                    print(weather)
                }
            )
            .store(in: &bag)
    }
    
    private func requestForecastWeather() {
        weatherService.requestForecastWeather()
            .decode(type: ForecastWeatherResponse.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(
                receiveCompletion: { [weak self] _ in
                    self?.forecastWeatherRes = nil
                },
                receiveValue: { [weak self] forecastWeather in
                    self?.forecastWeatherRes = forecastWeather
                    self?.dailyWeathers =  forecastWeather.dailyList
                    self?.hourlyWeathers = forecastWeather.list
                    self?.stateForecastWeather = .success
                    print(forecastWeather)
                }
            )
            .store(in: &bag)
    }
    
    //use Mock Data if needed
    private func getDataFromJson() {
        currentWeather = CurrentWeatherResponse.createMockCurrentWeather()
        let mockRes = ForecastWeatherResponse.createMockForecastWeather()
        dailyWeathers = mockRes.dailyList
        hourlyWeathers = mockRes.list
    }
    
    func retry() {
        stateModel = .loading
        stateCurrentWeather = .loading
        stateForecastWeather = .loading
        getCurrentWeather()
        requestForecastWeather()
       // getDataFromJson()
    }
    
    private func updateStateModel() {
        if stateCurrentWeather == .loading && stateForecastWeather == .loading {
            return
        } else if stateCurrentWeather == .success && stateForecastWeather == .success {
            stateModel = .success
        } else {
            stateModel = .failed
        }
    }
}


