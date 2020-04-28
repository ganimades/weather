//
//  CityNetwork.swift
//  Weather
//
//  Created by Filip Nowicki on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import Foundation
import RxSwift

protocol CityNetworkType {
    func fetchCityList() -> Observable<[City]>
}

class CityNetwork: CityNetworkType {
    //MARK: - Injected properties
    @Injected var network: NetworkType
    
    //MARK: - Networking
    func fetchCityList() -> Observable<[City]> {
        network.requestData(request: WeatherRouter.fetchCityList).map { data in
            try JSONDecoder().decode([City].self, from: data)
        }
    }
}
