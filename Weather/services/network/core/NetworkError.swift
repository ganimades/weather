//
//  RequestError.swift
//  Weather
//
//  Created by Filip Nowicki on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case invalidURL(String)
    case invalidResponse
    case noData
    case serializationError
}
