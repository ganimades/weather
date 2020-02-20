//
//  UrlProtocolMock.swift
//  Weather
//
//  Created by Filip Nowicki on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import Foundation

class UrlProtocolMock: URLProtocol {
    static var urls = [
        (try? WeatherRouter.fetchCityList.asUrlRequest())?.url: cityListData
    ]

    private static var cityListData: Data = {
        guard let path = Bundle.main.path(forResource: "city_list", ofType: "json")
            , let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
                return Data()
        }
        return jsonData
    }()
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        guard let url = request.url
            , let data = UrlProtocolMock.urls[url] else { return }
        
        client?.urlProtocol(self, didLoad: data)
        client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() { }
}
