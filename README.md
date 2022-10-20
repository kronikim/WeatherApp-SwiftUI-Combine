# WeatherApp-SwiftUI-Combine
WeatherApp-SwiftUI-Combine

Minimum deployment target is IOS 14.0
Latest version of Swift is used ( Swift 5.7, Xcode 14.1, IOS 16 )
SwiftUI and Combine are used
The App contains some UITest cases.
No third party library is used.

The App contains two tab bars. The first one is a weather screen. It shows the current weather condition, hourly forecast and the next few days of the selected city. (You may choose your favourite city from city.list.json file of the website (http://bulk.openweathermap.org/sample/) and paste the cityId into the WeatherService requests.)
The second one is an online shopping tab. It leads to the C&A shopping website through WebView.

API is from https://openweathermap.org which works with a unique API key. Please first get your unique API key from the website and set that apiKey in the absoluteURL of the WeatherEndpoint file.
There are two different services. These are current weather API and forecast weather API
Sample urls : "https://api.openweathermap.org/data/2.5/weather?APPID=\(apiKey)&units=metric&id=\(cityId)"
		        "https://api.openweathermap.org/data/2.5/forecast?APPID=\(apiKey)&units=metric&id=\(cityId)"
			
<img width="361" alt="Screen Shot 2022-10-20 at 21 32 11" src="https://user-images.githubusercontent.com/29311417/197030045-52121066-237c-41b7-aace-0835c596dd45.png">
<img width="349" alt="Screen Shot 2022-10-20 at 21 33 12" src="https://user-images.githubusercontent.com/29311417/197030149-b2b2e098-7127-4772-9011-e15cfac677e3.png">
