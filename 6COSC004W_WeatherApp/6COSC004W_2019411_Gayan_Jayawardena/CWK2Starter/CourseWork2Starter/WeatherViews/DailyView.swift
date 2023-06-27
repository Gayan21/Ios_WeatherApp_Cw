//
//  DailyView.swift
//  Coursework2
//
//  Created by G Lukka.
//

import SwiftUI

struct DailyView: View {
    var day : Daily
    
    var body: some View {
        
        HStack {
            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(day.weather[0].icon)@2x.png"))
            Spacer()
            VStack {
                Text(Date(timeIntervalSince1970: TimeInterval(((Int)(day.dt ?? 0))))
                    .formatted(.dateTime.weekday().hour()))
                .multilineTextAlignment(.center)
                
                Text("\(day.weather[0].weatherDescription.rawValue)")
            }
            
            Spacer()
            
            Text("\((Int)(day.temp.min))ºC/\((Int)(day.temp.max))ºC")
            
            
        }.padding()
    
    }
    
}

struct DailyView_Previews: PreviewProvider {
    static var day = ModelData().forecast!.daily
    
    static var previews: some View {
        DailyView(day: day[0])
    }
}
