//
//  BaseViewController.swift
//  Weather
//
//  Created by Filip Nowicki on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    //MARK: - Private properties
    private let activityView = UIActivityIndicatorView(style: .medium)
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupActivityIndicatorView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
    }
    
    private func setupActivityIndicatorView() {
        activityView.center = view.center
    }
    
    //MARK: -
    func showLoading() {
        view.addSubview(activityView)
        activityView.startAnimating()
    }
    
    func hideLoading() {
        activityView.stopAnimating()
        activityView.removeFromSuperview()
    }
    
    
}
