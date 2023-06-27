//
//  NavBar.swift
//  Coursework2
//
//  Created by G Lukka.
//

import SwiftUI

struct NavBar: View {
    
    var body: some View {
        TabView{
           Home()
                .tabItem{
                    
                    Label("City", systemImage: "magnifyingglass.circle")
//                    Text("City")
                }
            CurrentWeatherView()
                .tabItem {
                    
                    Label("WeatherNow", systemImage: "sun.max.circle")
//                    Text("WeatherNow")
                }
            
            HourlyView()
                .tabItem{
                    Label("HourlyView", systemImage: "clock.circle")
//                    Text("HourlyView")
                }
            ForecastView()
                .tabItem {
                    Label("ForecastView", systemImage: "calendar.circle")
//                    Text("ForecastView")
                }
            PollutionView()
                .tabItem {
                    Label("PollutionView", systemImage: "aqi.high")
//                    Text("PollutionView")
                }
        }
        .onAppear {
            UITabBar.appearance().isTranslucent = false
            
        }
        
    }
        
}

