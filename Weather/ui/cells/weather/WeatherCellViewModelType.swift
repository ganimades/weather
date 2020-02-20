//
//  WeatherCellViewModelType.swift
//  Weather
//
//  Created by Filip Nowicki on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import Foundation

protocol WeatherCellViewModelType {
    var dayTemperature: String { get }
    var dayNumber: String { get }
    var monthName: String { get }
}
