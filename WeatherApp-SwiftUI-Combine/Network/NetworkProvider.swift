//
//  NetworkProvider.swift
//  WeatherApp-SwiftUI-Combine
//
//  Created by deniz karahan on 19.10.2022.
//

import Foundation
import Combine

class NetworkProvider<Endpoint: EndpointProtocol> {
    func getData(from endpoint: Endpoint) -> AnyPublisher<Data, Error> {
        guard let request = performRequest(for: endpoint) else {
            return Fail(error: NetworkProviderError.invalidURL)
                .eraseToAnyPublisher()
        }
        
        return loadData(with: request)
            .eraseToAnyPublisher()
    }
    
    // MARK: - Request building
    private func performRequest(for endpoint: Endpoint) -> URLRequest? {
        print("url: \(endpoint.absoluteURL)")
        guard let urlComponents = URLComponents(string: endpoint.absoluteURL) else {
            return nil
        }
        
        guard let url = urlComponents.url else { return nil }
        let urlRequest = buildURLRequest(url, endpoint)
        return urlRequest
    }
    
    // MARK: - Getting data
    private func loadData(with request: URLRequest) -> AnyPublisher<Data, Error> {
        print("loadData func")
        return URLSession.shared.dataTaskPublisher(for: request)
            .mapError({ error -> Error in
                NetworkError(rawValue: error.code.rawValue) ?? NetworkProviderError.unknownError
            })
            .receive(on: RunLoop.main)
            .map { $0.data }
            .eraseToAnyPublisher()
    }
}

//MARK : build URLRequest
private extension NetworkProvider {
    func buildURLRequest(_ url: URL, _ endpoint: EndpointProtocol) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.httpMethod.rawValue
        urlRequest.cachePolicy = .reloadRevalidatingCacheData
        urlRequest.timeoutInterval = 30
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
           urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
        
        return urlRequest
    }
}
