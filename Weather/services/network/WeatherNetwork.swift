//
//  WeatherNetwork.swift
//  Weather
//
//  Created by Filip Nowicki on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import Foundation
import RxSwift

protocol WeatherNetworkType {
    func fetchForecast(forCity city: City) -> Observable<Forecast>
}

class WeatherNetwork: WeatherNetworkType {
    
    //MARK: - Injected properties
    @Injected var network: NetworkType
        
    //MARK: - Networking
    func fetchForecast(forCity city: City) -> Observable<Forecast> {
        let request = ForecastRequestModel(cityId: city.id, numberOfDays: 16)
        return network.requestData(request: WeatherRouter.fetchForecast(request: request))
            .map { data in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                return try decoder.decode(Forecast.self, from: data)
            }
    }
    
}
