//
//  ForecastCollctionViewCell.swift
//  Weather
//
//  Created by Gitko on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    //MARK: - Views
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    private let dayNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    private let monthNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackground()
        addSubviews()
    }
   
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    private func setupBackground() {
        layer.cornerRadius = 8
        backgroundColor = .lightGray
    }
    
    private func addSubviews() {
        addSubview(temperatureLabel)
        addSubview(monthNameLabel)
        addSubview(dayNumberLabel)
        
        temperatureLabel.anchor(top: topAnchor, paddingTop: 16, leading: leadingAnchor, paddingLeft: 16, bottom: nil, paddingBottom: 0, trailing: trailingAnchor, paddingRight: 16, width: 0, height: 0)
        dayNumberLabel.anchor(top: temperatureLabel.bottomAnchor, paddingTop: 8, leading: leadingAnchor, paddingLeft: 8, bottom: nil, paddingBottom: 0, trailing: trailingAnchor, paddingRight: 8, width: 0, height: 0)
        monthNameLabel.anchor(top: dayNumberLabel.bottomAnchor, paddingTop: 8, leading: leadingAnchor, paddingLeft: 8, bottom: bottomAnchor, paddingBottom: 8, trailing: trailingAnchor, paddingRight: 8, width: 0, height: 0)
    }
    
    func setup(with viewModel: WeatherCellViewModelType) {
        temperatureLabel.text = viewModel.dayTemperature
        monthNameLabel.text = viewModel.monthName
        dayNumberLabel.text = viewModel.dayNumber
    }
}
