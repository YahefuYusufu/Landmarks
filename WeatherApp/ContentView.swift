//
//  ContentView.swift
//  WeatherApp
//
//  Created by yusufyakuf on 2023-09-26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.lightBlue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Cupertino,CA")
                        .font(.system(size:32,weight: .medium,design: .default))
                        .foregroundColor(.white)
                        .padding()
                    VStack(spacing:10){
                        Image(systemName:"cloud.sun.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 180,height: 180)
                        Text("76°")
                            .font(.system(size: 70,weight: .medium))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    HStack(spacing:20){
                        WeatherDayView(dayOfWeek: "MON", imageName: "cloud.sun.fill", temperature: 76)
                        WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.bolt.fill", temperature: 76)
                        WeatherDayView(dayOfWeek: "WEN", imageName: "cloud.bolt.fill", temperature: 76)
                        WeatherDayView(dayOfWeek: "THU", imageName: "cloud.hail.fill", temperature: 76)
                        WeatherDayView(dayOfWeek: "FRY", imageName: "cloud.sun.rain.fill", temperature: 76)
                        
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
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28,weight: .medium))
                .foregroundColor(.white)
        }
    }
}
