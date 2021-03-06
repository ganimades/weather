//
//  CityListViewController.swift
//  Weather
//
//  Created by Gitko on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import UIKit

class CityListViewController: BaseViewController, BindableView {
    
    //MARK: - Injected properties
    @Injected private var viewModel: CityListViewModelType
    
    //MARK: - Private properties
    private var tableView: UITableView!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        setupTableView()
        bindViewModel()
    }
    
    //MARK: - UISetup
    private func createView() {
        tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 0, leading: view.safeAreaLayoutGuide.leadingAnchor, paddingLeft: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 0, trailing: view.safeAreaLayoutGuide.trailingAnchor, paddingRight: 0, width: 0, height: 0)
    }
    
    private func setupTableView() {
        viewModel.cellViewModelTypes.forEach { $0.registerCell(tableView: tableView) }
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK: - Data binding
    func bindViewModel() {
        viewModel.didUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.didError = { [weak self] error in
            self?.showAlert(message: error.localizedDescription, cancelTitle: "Cancel".localized)
        }
        viewModel.loadData()
    }

}

//MARK: - UITableViewDataSource
extension CityListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.citiesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.cityViewModel(atRow: indexPath.row)?.dequeueCell(tableView: tableView, atIndexPath: indexPath) ?? UITableViewCell()
    }
}

//MARK: - UITableViewDelegate
extension CityListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.onSelect(row: indexPath.row)
    }
}
