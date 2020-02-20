//
//  DateFormatter.swift
//  Weather
//
//  Created by Filip Nowicki on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import Foundation

class WeatherDateFormatter {
    static let dayNumericDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd"
        return df
    }()
    
    static let monthNameDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "MMM"
        return df
    }()
}
