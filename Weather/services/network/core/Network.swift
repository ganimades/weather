//
//  Network.swift
//  Weather
//
//  Created by Filip Nowicki on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import Foundation

class Network: NetworkType {
    
    //MARK: - Private properties
    @Injected var session: URLSession
    
    //MARK: - Networking
    func requestData(request: RouterType, completion: @escaping (Result<Data, Error>) -> Void) {
        do {
            let request = try request.asUrlRequest()
            let task = session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                    return
                }
                guard let data = data else {
                    DispatchQueue.main.async {
                        completion(.failure(NetworkError.noData))
                    }
                    return
                }
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            }
        
            task.resume()
        } catch let error {
            DispatchQueue.main.async {
                completion(.failure(error))
            }
        }
    }
}
