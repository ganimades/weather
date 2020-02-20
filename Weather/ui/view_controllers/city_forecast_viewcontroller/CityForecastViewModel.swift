//
//  CityForecastViewModel.swift
//  Weather
//
//  Created by Gitko on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import Foundation

class CityForecastViewModel: CityForecastViewModelType {
    //MARK: - Injected properties
    @Injected var network: WeatherNetworkType
    @Injected var city: City
    
    //MARK: - Private properties
    private var cellViewModels = [WeatherCellViewModel]()
    
    //MARK: - Public properties
    let cellViewModelTypes: [CollectionCellViewModelType.Type] = [WeatherCellViewModel.self]
    
    //MARK: - Callbacks
    var didUpdate: (()->())?
    var didError: ((Error)->())?
    
    //MARK: - Life cycle
    init(city: City) {
        self.$city.wrappedValue = city
    }
    
    //MARK: - Networking
    func loadData() {
        network.fetchForecast(forCity: city) { [weak self] result in
            switch result {
            case .success(let forecast):
                self?.prepareViewModels(for: forecast)
            case .failure(let error):
                self?.didError?(error)
            }
        }
    }
    
    //MARK: - Utils
    private func prepareViewModels(for forecast: Forecast) {
        cellViewModels = forecast.weather.map { WeatherCellViewModel(weather: $0) }
        didUpdate?()
    }
    
    //MARK: - Getters
    lazy var title: String = {
        return city.name
    }()
    
    var forecastDaysCount: Int {
        return cellViewModels.count
    }
    
    func viewModel(atRow row: Int) -> WeatherCellViewModel? {
        guard 0 ..< forecastDaysCount ~= row else {
            return nil
        }
        return cellViewModels[row]
    }
    
}
