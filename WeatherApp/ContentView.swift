//
//  ContentView.swift
//  WeatherApp
//
//  Created by yusufyakuf on 2023-09-26.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
            ZStack{
                BackGroundView(isNight: isNight)
                VStack{
                    CityName(cityName: "Cupertino,CA")
                    MainImage(imageName: isNight ? "moon.fill":"cloud.sun.fill",
                              temperature: 78)
             
                    HStack(spacing:20){
                        WeatherDayView(dayOfWeek: "MON", imageName: "cloud.sun.fill", temperature: 76)
                        WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.bolt.fill", temperature: 76)
                        WeatherDayView(dayOfWeek: "WEN", imageName: "cloud.bolt.fill", temperature: 76)
                        WeatherDayView(dayOfWeek: "THU", imageName: "cloud.hail.fill", temperature: 76)
                        WeatherDayView(dayOfWeek: "FRY", imageName: "cloud.sun.rain.fill", temperature: 76)
                    }
                    Spacer()
                    Button {
                        isNight.toggle()
                    }label: {
                        WeatherButton(title: "Change Text",
                                      textColor: .blue,
                                      backgroundColor: .white
                        )
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
    var dayOfWeek : String
    var imageName: String
    var temperature:Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16,weight: .medium,design: .default))
                .foregroundColor(.white)
            Image(systemName:imageName)
                .symbolRenderingMode(.palette)
                .resizable()
                .foregroundStyle(.gray,.white)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28,weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackGroundView: View {
    
    var isNight: Bool
         
    var body: some View {
       
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,isNight ? .gray : Color("lightblue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient )
            .ignoresSafeArea()
    }
}

struct CityName: View{
    var cityName: String
    
    
    
    var  body: some View {
        Text(cityName)
            .font(.system(size:32,weight: .medium,design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainImage: View {
    var imageName: String
    var temperature:Int

    
    var body: some View {
        VStack(spacing:10){
            Image(systemName:imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70,weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom,40)
    }
}

