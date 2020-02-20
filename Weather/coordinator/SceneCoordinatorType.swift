//
//  SceneCoordinatorType.swift
//  Weather
//
//  Created by Filip Nowicki on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import UIKit

protocol SceneCoordinatorType {
    typealias NavigateBackCompletion = (()->())
    
    func set(window: UIWindow)
    func transition(to scene: SceneType, type: SceneTransitionType)
    func pop(animated: Bool)
}
