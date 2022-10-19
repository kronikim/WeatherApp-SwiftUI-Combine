//
//  EndpointProtocol.swift
//  WeatherApp-SwiftUI-Combine
//
//  Created by deniz karahan on 19.10.2022.
//

import Foundation

protocol EndpointProtocol {
    var absoluteURL: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: [String: String] { get }
}
