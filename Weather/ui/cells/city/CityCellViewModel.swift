//
//  CityCellViewModel.swift
//  Weather
//
//  Created by Gitko on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import UIKit

class CityCellViewModel: CityCellViewModelType {
 
    //MARK: - Properties
    let city: City
    
    //MARK: - Life cycle
    init(city: City) {
        self.city = city
    }
    
    //MARK: - getters
    var cityName: String {
        return city.name
    }
}

extension CityCellViewModel: CellViewModelType {
    static func registerCell(tableView: UITableView) {
        tableView.register(CityTableViewCell.self, forCellReuseIdentifier: CityTableViewCell.identifier)
    }
    
    func dequeueCell(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier, for: indexPath) as? CityTableViewCell else {
            return UITableViewCell()
        }
        cell.setup(with: self)
        return cell
    }
    
}
