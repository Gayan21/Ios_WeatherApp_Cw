//
//  Conditions.swift
//  Coursework2
//
//  Created by G Lukka.
//

import SwiftUI

struct CurrentWeatherView: View {
    @EnvironmentObject var modelData: ModelData
    @State var locationString: String = "No location"
    
    var body: some View {
        ZStack {
            // Background Image rendering code here
            Image("background2")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 7)
            
            ScrollView {
                VStack {
                    Label("\(modelData.userLocation)" , systemImage: "mappin")
                        .padding()
                        .font(.title)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
    
                    
                    VStack{
                        
                        VStack {
                            Text("\((Int)(modelData.forecast!.current.temp))ºC")
                                .padding()
                                .font(.system(size: 70))
                            HStack {
                                AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(modelData.forecast!.current.weather[0].icon)@2x.png"))
                                
                                Text(modelData.forecast!.current.weather[0].weatherDescription.rawValue.capitalized)
                                    .bold()
                            }
                            
                            VStack {
                                Text("Feels Like: \((Int)(modelData.forecast!.current.feelsLike))ºC")
                                    .foregroundColor(.black)
                                HStack {
                                    Text("Wind Speed: \((Int)(modelData.forecast!.current.windSpeed)) m/s")
                                    
                                    Spacer()
                                    
                                    Text("Direction: \(convertDegToCardinal(deg:modelData.forecast!.current.windDeg))")
                                }
                                .padding()
                                
                                HStack {
                                    Text("Humidity: \((Int)(modelData.forecast!.current.humidity))%")
                                    
                                    Spacer()
                                    
                                    Text("Pressure: \((Int)(modelData.forecast!.current.pressure)) hPa")
                                }
                                .padding()
                                
                                HStack{
                                    HStack {
                                        Image(systemName: "sunrise.fill")
                                            .foregroundColor(.yellow)
                                        Text(Date(timeIntervalSince1970: TimeInterval(((Int)(modelData.forecast?.current.sunrise ?? 0))))
                                            .formatted(.dateTime.hour().minute()))
                                    }
                                    
                                    HStack {
                                        
                                        Image(systemName: "sunset.fill")
                                            .foregroundColor(.yellow)
                                        
                                        Text(Date(timeIntervalSince1970: TimeInterval(((Int)(modelData.forecast?.current.sunset ?? 0))))
                                            .formatted(.dateTime.hour().minute()))
                                        
                                        
                                    }
                                }
                            }
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(100)
                        }.padding()
                    }
                    
                }
                .foregroundColor(.black)
            .shadow(color: .black,  radius: 0.5)
            }
            
        }
    }
}

struct Conditions_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView()
            .environmentObject(ModelData())
    }
}
