//
//  NetworkType.swift
//  Weather
//
//  Created by Filip Nowicki on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import Foundation
import RxSwift

protocol NetworkType {
    func requestData(request: RouterType) -> Observable<Data>
}
