//
//  CollectionCellViewModelType.swift
//  Weather
//
//  Created by Gitko on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import UIKit

protocol CollectionCellViewModelType {
    static func registerCell(collectionView: UICollectionView)
    func dequeueCell(collectionView: UICollectionView, atIndexPath indexPath: IndexPath) -> UICollectionViewCell 
}
