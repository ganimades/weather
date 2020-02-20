//
//  CityListViewModelType.swift
//  Weather
//
//  Created by Filip Nowicki on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import Foundation

protocol CityListViewModelType {
    var didUpdate: (()->())? { get set }
    var didError: ((Error)->())? { get set }
    var cellViewModelTypes: [CellViewModelType.Type] { get }
    var citiesCount: Int { get }
    
    func loadData()
    func cityViewModel(atRow row: Int) -> CityCellViewModel?
    func onSelect(row: Int)
}
