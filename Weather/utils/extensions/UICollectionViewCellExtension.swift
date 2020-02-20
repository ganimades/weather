//
//  UICollectionViewCellExtension.swift
//  Weather
//
//  Created by Gitko on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    class var identifier: String {
        return String(describing: self)
    }
}
