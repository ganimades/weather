//
//  Coordinate.swift
//  Weather
//
//  Created by Filip Nowicki on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import Foundation

struct Coordinate: Codable {
    var latitude: Double
    var longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
    }
}
