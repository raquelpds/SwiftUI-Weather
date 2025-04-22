//
//  ContentView.swift
//  SwiftUI-WeatherAPP
//
//  Created by Raquel Souza on 19/04/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack{
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                
                HStack (spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 32)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "cloud.bolt.rain.fill",
                                   temperature: 23)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "sun.max.fill",
                                   temperature: 39)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.sun.rain.fill",
                                   temperature: 30)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "cloud.sun.fill",
                                   temperature: 34)
                    
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()

    }
}

struct MainWeatherView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        
        .padding(.bottom, 50)
    }

}

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundStyle(textColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}
