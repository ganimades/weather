//
//  WeatherScene.swift
//  Weather
//
//  Created by Gitko on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import UIKit

enum WeatherScene {
    case cityList
    case forecast(city: City)
}

extension WeatherScene: SceneType {
    func viewController() -> UIViewController? {
        switch self {
        case .cityList:
            return Resolver.root.resolve(CityListViewController.self)
        case .forecast(let city):
            return Resolver.root.resolve(CityForecastViewController.self, arg: city)
        }
    }
}



