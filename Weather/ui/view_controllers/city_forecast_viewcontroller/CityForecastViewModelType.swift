//
//  CityForecastViewModelType.swift
//  Weather
//
//  Created by Filip Nowicki on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import Foundation

protocol CityForecastViewModelType {
    var didUpdate: (()->())? { get set }
    var didError: ((Error)->())? { get set }
    
    var cellViewModelTypes: [CollectionCellViewModelType.Type] { get }
    var title: String { get }
    var forecastDaysCount: Int { get }
    
    func loadData()
    func viewModel(atRow row: Int) -> WeatherCellViewModel?
}
