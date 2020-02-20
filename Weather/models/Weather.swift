//
//  Weather.swift
//  Weather
//
//  Created by Filip Nowicki on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    
    var dayTemp: Double
    var nightTemp: Double
    var date: Date
    
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case dayTemp = "day"
        case nightTemp = "night"
        case date = "dt"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        date = try container.decode(Date.self, forKey: .date)
        
        let temperature = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .temp)
        dayTemp = try temperature.decode(Double.self, forKey: .dayTemp)
        nightTemp = try temperature.decode(Double.self, forKey: .nightTemp)
    }
    
    init(dayTemp: Double, nightTemp: Double, date: Date) {
        self.dayTemp = dayTemp
        self.date = date
        self.nightTemp = nightTemp
    }
}
