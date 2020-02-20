//
//  Forecast.swift
//  Weather
//
//  Created by Filip Nowicki on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import Foundation

struct Forecast: Decodable {
    var weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case weather = "list"
    }
}
