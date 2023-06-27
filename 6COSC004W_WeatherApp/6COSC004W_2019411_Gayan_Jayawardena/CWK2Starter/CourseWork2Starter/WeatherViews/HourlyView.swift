//
//  Hourly.swift
//  Coursework2
//
//  Created by G Lukka.
//

import SwiftUI

struct HourlyView: View {
    
   @EnvironmentObject var modelData: ModelData

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 7)
            
            VStack{
                Label("\(modelData.userLocation)" , systemImage: "mappin")
                    .padding()
                    .font(.title)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)

                
                List {
                    ForEach(modelData.forecast!.hourly) { hour in
                        HourCondition(current: hour)
                        
                    }
                }
                .opacity(0.9)

            }
        }
        
    }
}

struct Hourly_Previews: PreviewProvider {
    static var previews: some View {
        HourlyView().environmentObject(ModelData())
    }
}
