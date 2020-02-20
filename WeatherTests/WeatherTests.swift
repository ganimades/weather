//
//  WeatherTests.swift
//  WeatherTests
//
//  Created by Filip Nowicki on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import XCTest
@testable import Weather

class WeatherTests: XCTestCase {
    
    func testCityNetwork() {
        let network = Resolver.root.resolve(CityNetworkType.self)
        XCTAssertNotNil(network)
        
        let cityExpectaions = expectation(description: "returns city list")
        var cityResponse: [City]?
        
        network?.fetchCityList(completion: { result in
            switch result {
            case .success(let cityList):
                cityResponse = cityList
                cityExpectaions.fulfill()
            default: break
            }
        })
        
        waitForExpectations(timeout: 0.5) { error in
            XCTAssertNotNil(cityResponse)
            XCTAssertTrue(cityResponse?.count == 35)
        }
    }
    
    
    func testWeatherNetwork() {
        let weatherNetwork = WeatherNetwork()
        let networkMock = NetworkMock()
        weatherNetwork.$network.wrappedValue = networkMock
        
        let forecastExpectation = expectation(description: "returns forecast weather list")
        var forecastResponse: Forecast?
        
        let cityMock = City(id: 0, name: "", countryCode: "", location: Coordinate(latitude: 0, longitude: 0))
        weatherNetwork.fetchForecast(forCity: cityMock) { result in
            switch result {
            case .success(let forecast):
                forecastResponse = forecast
                forecastExpectation.fulfill()
            default: break
            }
        }
        
        waitForExpectations(timeout: 0.5) { error in
            XCTAssertNotNil(forecastResponse)
            XCTAssertTrue(forecastResponse?.weather.count == 3)
        }
    }
    
    func testCityListViewModel() {
        var viewModel = Resolver.root.resolve(CityListViewModelType.self)
        XCTAssertNotNil(viewModel)
        
        let viewModelExpectation = expectation(description: "calls didUpdate callback")
        
        var called = false
        viewModel?.didUpdate = {
            viewModelExpectation.fulfill()
            called = true
        }
        viewModel?.loadData()
        waitForExpectations(timeout: 0.5) { error in
            XCTAssertTrue(called)
        }
        
        XCTAssertTrue(viewModel?.citiesCount == 35)
    }
    
    func testCityListViewController() {
        let viewController = Resolver.root.resolve(CityListViewController.self)
        XCTAssertNotNil(viewController)
    }
    
    func testDateFormatter() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: "2020-02-20")
        XCTAssertNotNil(date)
        let dayNumer = WeatherDateFormatter.dayNumericDateFormatter.string(from: date!)
        XCTAssertTrue(dayNumer == "20")
        
    }
    
    func testWeatherCellViewModel() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: "2020-02-20")
        XCTAssertNotNil(date)
        let weatherMock = Weather(dayTemp: 12, nightTemp: 7, date: date!)
        let viewModel = WeatherCellViewModel(weather: weatherMock)
        XCTAssertTrue(viewModel.dayNumber == "20")
        XCTAssertTrue(viewModel.dayTemperature == "12°C")
    }
    
    private class NetworkMock: NetworkType {
        func requestData(request: RouterType, completion: @escaping (Result<Data, Error>) -> Void) {
            return completion(.success(forecastData))
        }
        
        var forecastData: Data = {
            guard let path = Bundle(for: NetworkMock.self).path(forResource: "forecast", ofType: "json")
                , let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
                    return Data()
            }
            return jsonData
        }()
    }
}


