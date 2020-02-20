//
//  AppCoordinator.swift
//  Weather
//
//  Created by Filip Nowicki on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    //MARK: Injected properties
    @Injected var sceneCoordinator: SceneCoordinatorType

    //MARK: - Start App
    func start(window: UIWindow?) {
        guard let window = window else { return }
        sceneCoordinator.set(window: window)
        sceneCoordinator.transition(to: WeatherScene.cityList, type: .root)
    }

    
}
