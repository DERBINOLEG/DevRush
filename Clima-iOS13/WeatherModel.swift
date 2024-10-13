//
//  WeatherModel.swift
//  Clima
//
//  Created by Олег Дербин on 13.10.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let cityName: String
    let conditionId: Int
    let temperature: Double
    
    var temperatureString: String {
        String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        getConditionName(wearherId: conditionId)
    }
    
    func getConditionName(wearherId: Int) -> String {
        switch wearherId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
        
    }
}
