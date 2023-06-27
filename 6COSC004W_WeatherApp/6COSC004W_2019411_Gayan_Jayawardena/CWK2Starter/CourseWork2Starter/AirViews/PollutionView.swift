//
//  PollutionView.swift
//  Coursework2
//
//  Created by GirishALukka on 30/12/2022.
//

import SwiftUI

struct PollutionView: View {
    
    // @EnvironmentObject and @State varaibles here
    @EnvironmentObject var modelData: ModelData
    
    
    var body: some View {
        
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 7)
            // Use ZStack for background images
            
            ScrollView {
                VStack {
                    Label("\(modelData.userLocation)" , systemImage: "mappin")
                        .padding()
                        .font(.title)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    Text("\((Int)(modelData.forecast!.current.temp))ºC")
                        .font(.system(size: 70))
                    
                    HStack{
                    AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(modelData.forecast!.current.weather[0].icon)@2x.png"))
                    
                    Text("\(modelData.forecast!.current.weather[0].weatherDescription.rawValue)")
                        .textCase(.uppercase)
                        .padding()
                        .font(.title2)
                        .bold()
                }
                    
                    Text("Feels Like: \((Int)(modelData.forecast!.current.feelsLike))ºC")
                    
                    Text("Air Quality Data")
                        .font(.largeTitle)
                    
                    HStack {
                        VStack {
                            Image ("so2")
                            Text("\(String(format: "%.2f" , modelData.airPollutionData?.list[0].components.so2 ?? 0))")
        //                    Text("\(modelData)")
                        }
                        VStack {
                            Image ("no")
                            Text("\(String(format: "%.2f" , modelData.airPollutionData?.list[0].components.no ?? 0))")
                            
                        }
                        VStack {
                            Image ("voc")
                            Text("\(String(format: "%.2f" , modelData.airPollutionData?.list[0].components.no ?? 0))")
                        }
                        VStack {
                            Image ("pm")
                            Text("\(String(format: "%.2f" , modelData.airPollutionData?.list[0].components.pm10 ?? 0))")
                            
                        }
                    }
                    
                    Spacer()
                    
                }
                .foregroundColor(.black)
            .shadow(color: .black,  radius: 0.5)
            }
            
            
        }
        .onAppear {
            Task {
                try await modelData.loadPollutionData()
            }
        }
    }
}



