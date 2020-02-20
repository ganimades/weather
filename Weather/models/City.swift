//
//  City.swift
//  Weather
//
//  Created by Filip Nowicki on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import Foundation

struct City: Codable {
    var id: Int
    var name: String
    var countryCode: String
    var location: Coordinate
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case countryCode = "country"
        case location = "coord"
    }
}
