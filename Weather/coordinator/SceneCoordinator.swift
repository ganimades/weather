//
//  CoordinatorType.swift
//  Weather
//
//  Created by Filip Nowicki on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import UIKit

class SceneCoordinator: NSObject, SceneCoordinatorType {
    
    static let shared = SceneCoordinator()
    
    private var window: UIWindow?
    private var currentViewController: UIViewController?
    
    override init() {}
    
    func transition(to scene: SceneType, type: SceneTransitionType) {
        guard let viewController = scene.viewController() else {
            return
        }
        
        switch type {
        case .root:
            let nvc = UINavigationController(rootViewController: viewController)
            nvc.delegate = self
            window?.rootViewController = nvc
            currentViewController = viewController
            
        case .push:
            guard let navigationController = currentViewController?.navigationController else {
                return
            }
            navigationController.pushViewController(viewController, animated: true)
            currentViewController = viewController
        }
    }
    
    func pop(animated: Bool) {
        guard let navigationController = currentViewController?.navigationController else {
            return
        }
        navigationController.popViewController(animated: animated)
    }
    
    func set(window: UIWindow) {
        self.window = window
        currentViewController = window.rootViewController
    }
}

//MARK: - UINavigationControllerDelegate
extension SceneCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        currentViewController = viewController
    }
}
