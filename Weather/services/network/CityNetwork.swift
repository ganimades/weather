//
//  CityNetwork.swift
//  Weather
//
//  Created by Filip Nowicki on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import Foundation

protocol CityNetworkType {
    func fetchCityList(completion: @escaping (Result<[City], Error>) -> Void)
}

class CityNetwork: CityNetworkType {
    //MARK: - Injected properties
    @Injected var network: NetworkType
    
    //MARK: - Networking
    func fetchCityList(completion: @escaping (Result<[City], Error>) -> Void) {
        network.requestData(request: WeatherRouter.fetchCityList) { result in
            switch result {
            case .success(let data):
                do {
                    let cityList = try JSONDecoder().decode([City].self, from: data)
                    completion(.success(cityList))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
