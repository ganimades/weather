//
//  ForecastCellViewModel.swift
//  Weather
//
//  Created by Gitko on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import UIKit

class WeatherCellViewModel: WeatherCellViewModelType {
 
    //MARK: - Properties
    private let weather: Weather
    
    //MARK: - Life cycle
    init(weather: Weather) {
        self.weather = weather
    }
    
    //MARK: - getters
    var dayTemperature: String {
        return String(Int(weather.dayTemp.rounded())) + "°C"
    }
    
    var dayNumber: String {
        return WeatherDateFormatter.dayNumericDateFormatter.string(from: weather.date)
    }
    
    var monthName: String {
        return WeatherDateFormatter.monthNameDateFormatter.string(from: weather.date)
    }
}

extension WeatherCellViewModel: CollectionCellViewModelType {
    static func registerCell(collectionView: UICollectionView) {
        collectionView.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: WeatherCollectionViewCell.identifier)
    }
    
    func dequeueCell(collectionView: UICollectionView, atIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCollectionViewCell.identifier, for: indexPath) as? WeatherCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setup(with: self)
        return cell
    }
    
}
