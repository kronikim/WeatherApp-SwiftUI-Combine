//
//  WebViewViewModel.swift
//  WeatherApp-SwiftUI-Combine
//
//  Created by deniz karahan on 17.10.2022.
//

import Foundation
import Combine

class WebViewViewModel: ObservableObject {
    var webViewNavigationPublisher = PassthroughSubject<WebViewNavigation, Never>()
    var showWebTitle = PassthroughSubject<String, Never>()
    var showLoader = PassthroughSubject<Bool, Never>()
    var valuePublisher = PassthroughSubject<String, Never>()
    var url : String = WebViewUrl.onlineShoppingUrl.rawValue
}

// For identifiying WebView's forward and backward navigation and reloading
enum WebViewNavigation {
    case backward, forward, reload
}

enum WebViewUrl: String {
    case onlineShoppingUrl = "https://www.c-and-a.com/de/de/shop"
    case weatherUrl = "https://openweathermap.org"
}
