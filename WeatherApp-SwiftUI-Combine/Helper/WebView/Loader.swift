//
//  Loader.swift
//  WeatherApp-SwiftUI-Combine
//
//  Created by deniz karahan on 17.10.2022.
//

import SwiftUI

struct Loader: View {
    @State var spinCircle = false
    
    var body: some View {
        ZStack {
            Rectangle().frame(width:160, height: 135).background(Color.gray).cornerRadius(8).opacity(0.6).shadow(color: .secondary, radius: 16)
            VStack {
                Circle()
                    .trim(from: 0.3, to: 1)
                    .stroke(Color.white, lineWidth:3)
                    .frame(width:40, height: 40)
                    .padding(.all, 8)
                    .rotationEffect(.degrees(spinCircle ? 0 : -360), anchor: .center)
                    .animation(Animation.linear(duration: 0.6).repeatForever(autoreverses: false))
                    .onAppear {
                        self.spinCircle = true
                    }
                Text("Loading...").foregroundColor(.white)
            }
        }
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader()
    }
}

