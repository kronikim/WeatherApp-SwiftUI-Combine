//
//  WeatherBackgroundView.swift
//  WeatherApp-SwiftUI-Combine
//
//  Created by deniz karahan on 19.10.2022.
//

import SwiftUI

struct WeatherBackgroundView: View {
    var body: some View {
        let clodyScheme = [Color(red: 41/255, green: 128/255, blue: 184/255),
                           Color(red: 109/255, green: 212/255, blue: 250/255),
                           Color(red: 109/255, green: 212/255, blue: 250/255),
                           Color(red: 109/255, green: 212/255, blue: 250/255),
                           Color.white]

       /* let nightScheme = [Color.black,
                             Color(red: 20/255, green: 31/255, blue: 78/255),
                             Color(red: 141/255, green: 87/255, blue: 151/255)] */
        //TODO: Add hour control if it is a night change the scheme
        let colorScheme : [Color] = clodyScheme
        
        let gradient = Gradient(colors: colorScheme)
        let linearGradient = LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
        
        let background = Rectangle()
            .fill(linearGradient)
            .blur(radius: 200, opaque: true)
            .edgesIgnoringSafeArea(.all)
        
        return background
    }
}

struct WeatherBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherBackgroundView()
    }
}
