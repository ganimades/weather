//
//  Assembler.swift
//  Weather
//
//  Created by Gitko on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import UIKit

struct Assembler {
    func registerAllDependencies() {
        
        let resolver = Resolver.root
        
        //MARK: - App
        resolver.register(AppCoordinator.self) { r in
            return AppCoordinator()
        }
        
        //MARK: - Network
        resolver.register(URLSession.self) { r in
            return URLSession(configuration: URLSessionConfiguration.ephemeral)
        }
        
        resolver.register(URLSession.self) { (r, sessionConfig: URLSessionConfiguration) in
            return URLSession(configuration: sessionConfig)
        }
        
        resolver.register(NetworkType.self) { (r, session: URLSession) in
            let network = Network()
            network.$session.wrappedValue = session
            return network
        }
        
        resolver.register(NetworkType.self) { r in
            return Network()
        }
        
        resolver.register(WeatherNetworkType.self) { r in
            return WeatherNetwork()
        }
        
        resolver.register(CityNetworkType.self) { r in
            let sessionConfig = URLSessionConfiguration.ephemeral
            sessionConfig.protocolClasses = [UrlProtocolMock.self]
            let session = r.resolve(URLSession.self, arg: sessionConfig)!
            let network = r.resolve(NetworkType.self, arg: session)!
            let cityNetwork = CityNetwork()
            cityNetwork.$network.wrappedValue = network
            return cityNetwork
        }
        
        //MARK: - Coordinator
        resolver.register(SceneCoordinatorType.self) { r in
            return SceneCoordinator.shared
        }

        //MARK: - ViewModels
        resolver.register(CityListViewModelType.self) { r in
            return CityListViewModel()
        }
        
        resolver.register(CityForecastViewModelType.self) { (r, city: City) in
            return CityForecastViewModel(city: city)
        }
        
        //MARK: - ViewControllers
        resolver.register(CityListViewController.self) { r in
            return CityListViewController()
        }
        
        resolver.register(CityForecastViewController.self) { (r, city: City) in
            let vc = CityForecastViewController()
            let vm = r.resolve(CityForecastViewModelType.self, arg: city)!
            vc.$viewModel.wrappedValue = vm
            return vc
        }
        
    }
}
