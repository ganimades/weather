//
//  CityForecastViewController.swift
//  Weather
//
//  Created by Gitko on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import UIKit

class CityForecastViewController: BaseViewController, BindableView {
    //MARK: - Injected properties
    @Injected var viewModel: CityForecastViewModelType
    
    //MARK: - Private properties
    private let flowLayout = UICollectionViewFlowLayout()
    
    private var collectionView: UICollectionView!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        setupCollectionView()
        showLoading()
        bindViewModel()
    }
    
    //MARK: - UISetup
    private func createView() {
        title = viewModel.title
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 0, leading: view.safeAreaLayoutGuide.leadingAnchor, paddingLeft: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 0, trailing: view.safeAreaLayoutGuide.trailingAnchor, paddingRight: 0, width: 0, height: 0)
    }
    
    private func setupCollectionView() {
        viewModel.cellViewModelTypes.forEach { $0.registerCell(collectionView: collectionView) }
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    //MARK: - Data binding
    func bindViewModel() {
        viewModel.didUpdate = { [weak self] in
            self?.hideLoading()
            self?.collectionView.reloadData()
        }
        
        viewModel.didError = { [weak self] error in
            self?.showAlert(message: error.localizedDescription, cancelTitle: "Cancel".localized)
        }
        viewModel.loadData()
    }
    
}

//MARK: - UICollectionViewDataSource
extension CityForecastViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.forecastDaysCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return viewModel.viewModel(atRow: indexPath.row)?.dequeueCell(collectionView: collectionView, atIndexPath: indexPath) ?? UICollectionViewCell()
    }
}

extension CityForecastViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 16, bottom: 32, right: 16)
    }
}
