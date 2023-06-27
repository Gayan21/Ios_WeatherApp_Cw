//
//  AirPollutionModelData.swift
//  CourseWork2Starter
//
//  Created by Gayan on 2023-03-31.
//

import Foundation

struct AirPollutionModelData: Codable {
    let coord : Coord
    let list : [AirPollutionDataList]
    
}

struct Coord: Codable {
    let lon : Double
    let lat : Double
}

struct AirPollutionDataList : Codable {
    let main: AirPollutionDataMain
    let components: AirPollutionDataComponent
    let dt : Int
}

//refactor with coding keys
struct AirPollutionDataComponent : Codable {
    let co :Double
    let no : Double
    let no2 : Double
    let o3 : Double
    let so2 : Double
    let pm2_5 : Double
    let pm10 : Double
    let nh3 : Double
}


struct AirPollutionDataMain : Codable {
    let aqi: Int
}
