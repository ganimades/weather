//
//  CityListViewModel.swift
//  Weather
//
//  Created by Gitko on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CityListViewModel: CityListViewModelType {
    
    //MARK: - Private properties
    private let disposeBag = DisposeBag()
    
    //MARK: - Injected properties
    @Injected private var network: CityNetworkType
    @Injected private var sceneCoordinator: SceneCoordinatorType
    
    //MARK: - Private properties
    private var cityCellViewModels = [CityCellViewModel]()
    
    //MARK: - Public properties
    let cellViewModelTypes: [CellViewModelType.Type] = [CityCellViewModel.self]
    
    //MARK: - Callbacks
    var didUpdate: (()->())?
    var didError: ((Error)->())?
    
    //MARK: - Networking
    func loadData() {
        network.fetchCityList().observeOn(MainScheduler.instance).subscribe(onNext: { [weak self] cityList in
            self?.prepareViewModels(for: cityList)
        }, onError: { [weak self] error in
            self?.didError?(error)
        }).disposed(by: disposeBag)
    }
    
    //MARK: - Utils
    private func prepareViewModels(for cityList: [City]) {
        cityCellViewModels = cityList.map { CityCellViewModel(city: $0) }
        didUpdate?()
    }
    
    //MARK: - Getters
    var citiesCount: Int {
        return cityCellViewModels.count
    }
    
    func cityViewModel(atRow row: Int) -> CityCellViewModel? {
        guard 0 ..< citiesCount ~= row else {
            return nil
        }
        return cityCellViewModels[row]
    }
    
    //MARK - Actions
    func onSelect(row: Int) {
        guard let selected = cityViewModel(atRow: row) else { return }
        sceneCoordinator.transition(to: WeatherScene.forecast(city: selected.city), type: .push)
    }
}
