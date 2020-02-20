//
//  WeatherRouter.swift
//  Weather
//
//  Created by Filip Nowicki on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import Foundation

enum WeatherRouter: RouterType {
      
    case fetchCityList
    case fetchForecast(request: ForecastRequestModel)
    
    var path: String {
        switch self {
        case .fetchCityList: return "/cityList"
        case .fetchForecast: return "/forecast/daily"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: JSON {
        switch self {
        case .fetchForecast(let request):
            return [
                "id": "\(request.cityId)",
                "cnt": "\(request.numberOfDays)",
                "appid": AppConfiguration.weatherApiKey,
                "units": "metric"
            ]
        default:
            return [:]
        }
    }
    
    
}
