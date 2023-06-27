//
//  HomeView.swift
//  CWK2_23_GL
//
//  Created by GirishALukka on 10/03/2023.
//

import SwiftUI
import CoreLocation

struct Home: View {
    
    @EnvironmentObject var modelData: ModelData
    @State var isSearchOpen: Bool = false
    @State  var userLocation: String = ""
    
    
    var body: some View {
        ZStack {
            
            Image("background2")
                .resizable()

                .ignoresSafeArea()
                .blur(radius: 7)
            
            ScrollView {
                VStack (spacing: 10) {
                    Label("\(userLocation)" , systemImage: "mappin")
                        .padding()
                        .font(.title)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
   
                    
                    Text(Date(timeIntervalSince1970: TimeInterval(((Int)(modelData.forecast?.current.dt ?? 0))))
                        .formatted(.dateTime.year().hour().month().day()))
                    .padding()
                    .font(.largeTitle)
                    .bold()
                    
                    HStack{
                        Text("Temp").padding().foregroundColor(.black)
                        Divider().frame(width: 1,height: 50).overlay(.black)
                        Text("\((Int)(modelData.forecast!.current.temp))ºC")
                            .font(.title2)
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                        
                    }
                    
                    HStack{
                        Text("Humidity").padding(.trailing).foregroundColor(.black)
                        Divider().frame(width: 1,height: 50).overlay(.black)
                        Text("\((Int)(modelData.forecast!.current.humidity))%")
                            .font(.title2)
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                        
                    }
    
                    HStack{
                        Text("Pressure").padding(30).foregroundColor(.black)
                        Divider().frame(width: 1,height: 50).overlay(.black)
                        Text("\((Int)(modelData.forecast!.current.pressure)) hPa")
                            .font(.title2)
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                        
                    }
    
                    
                    Spacer()
                    HStack {
                        AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(modelData.forecast!.current.weather[0].icon)@2x.png"))
                        
                        Text("\(modelData.forecast!.current.weather[0].weatherDescription.rawValue)")
                            .textCase(.uppercase)
                            .padding()
                            .font(.title2)
                            .bold()
                        
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(100)
                    Spacer()
                    
                    Button {
                        self.isSearchOpen.toggle()
                    } label: {
                        Image(systemName: "location.fill")
                            .foregroundColor(.black)
                        Text("Change Location")
                            .bold()
                            .foregroundColor(.black)
                    }
                    .font(.system(size: 15))
                    .buttonStyle(.borderedProminent)
                    .tint(.white)
                    .cornerRadius(30)
                    .sheet(isPresented: $isSearchOpen) {
                        SearchView(isSearchOpen: $isSearchOpen, userLocation: $userLocation)
                    }
                    .padding()
                    
                    Spacer()
                    

                }
               
                
                .onAppear {
                    Task.init {
                        self.userLocation = await getLocFromLatLong(lat: modelData.forecast!.lat, lon: modelData.forecast!.lon)
                        
                        modelData.userLocation = self.userLocation
                        
                    }
                    
            }
            }
        }
        
    }
}
