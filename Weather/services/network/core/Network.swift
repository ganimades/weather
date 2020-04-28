//
//  Network.swift
//  Weather
//
//  Created by Filip Nowicki on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import Foundation
import RxSwift

class Network: NetworkType {
    
    //MARK: - Private properties
    @Injected var session: URLSession
    
    //MARK: - Networking
    func requestData(request: RouterType) -> Observable<Data> {
        Observable.create { observer in
            do {
                let request = try request.asUrlRequest()
                let task = self.session.dataTask(with: request) { (data, response, error) in
                    if let error = error {
                        observer.onError(error)
                        return
                    }
                    guard let data = data else {
                        observer.onError(NetworkError.noData)
                        return
                    }
                    observer.onNext(data)
                }
            
                task.resume()
            } catch let error {
                observer.onError(error)
            }
            return Disposables.create()
        }
        
    }
}
