//
//  CityTableViewCell.swift
//  Weather
//
//  Created by Gitko on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
 
    //MARK: - Views
    private let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    //MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(nameLabel)
        nameLabel.anchor(top: topAnchor, paddingTop: 16, leading: leadingAnchor, paddingLeft: 16, bottom: bottomAnchor, paddingBottom: 16, trailing: trailingAnchor, paddingRight: 16, width: 0, height: 0)
    }
    
    //MARK: - Setup
    func setup(with viewModel: CityCellViewModelType) {
        nameLabel.text = viewModel.cityName
    }
}
