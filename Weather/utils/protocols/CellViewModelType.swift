//
//  CellViewModelType.swift
//  Weather
//
//  Created by Gitko on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import UIKit

protocol CellViewModelType {
    static func registerCell(tableView: UITableView)
    func dequeueCell(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell
}
