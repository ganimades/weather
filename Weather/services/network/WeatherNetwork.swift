//
//  WeatherNetwork.swift
//  Weather
//
//  Created by Filip Nowicki on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import Foundation

protocol WeatherNetworkType {
    func fetchForecast(forCity city: City, completion: @escaping (Result<Forecast, Error>) -> Void)
}

class WeatherNetwork: WeatherNetworkType {
    
    //MARK: - Injected properties
    @Injected var network: NetworkType
        
    //MARK: - Networking
    func fetchForecast(forCity city: City, completion: @escaping (Result<Forecast, Error>) -> Void) {
        let request = ForecastRequestModel(cityId: city.id, numberOfDays: 16)
        network.requestData(request: WeatherRouter.fetchForecast(request: request)) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970
                    let forecast = try decoder.decode(Forecast.self, from: data)
                    completion(.success(forecast))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
