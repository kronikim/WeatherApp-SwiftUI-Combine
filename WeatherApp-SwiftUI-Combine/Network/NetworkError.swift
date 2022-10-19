//
//  APIErrors.swift
//  WeatherApp-SwiftUI-Combine
//
//  Created by deniz karahan on 19.10.2022.
//

import Foundation

enum NetworkError: Int, LocalizedError {
    case badRequest = 400
    case unAuthorized = 401
    case invalidCityId = 404
    case requestTimeOut = 408
    case tooManyRequests = 429
    case serverError = 500

    var errorDescription: String? {
        switch self {
        case .badRequest:
            return "Bad Request, Please check your request and try again.".localized()
        case .tooManyRequests:
            return "You made too many requests within a window of time and have been rate limited.".localized()
        case .serverError:
            return "Server error.".localized()
        case .unAuthorized:
            return "Please activate yoru APIKEY and try again".localized()
        case .invalidCityId:
            return "Your city Id is not valid , please check it.".localized()
        case .requestTimeOut:
            return "Request TimeOut".localized()
        default:
            return "Something goes wrong.".localized()
        }
    }
}


enum NetworkProviderError: LocalizedError {
    case invalidURL
    case dataNil
    case decodingError
    case unknownError
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Check the url.It is invalid".localized()
        case .dataNil:
            return "Empty data.".localized()
        case .decodingError:
            return "Data has invalid format.".localized()
        default:
            return "Something goes wrong.".localized()
        }
    }
}
