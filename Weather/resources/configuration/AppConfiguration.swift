//
//  AppConfiguration.swift
//  Weather
//
//  Created by Filip Nowicki on 20/02/2020.
//  Copyright © 2020 Filip Nowicki. All rights reserved.
//

import Foundation

class AppConfiguration {

    //MARK: - Configuration keys
    private enum ConfigurationKey: String {
        case configDict = "Configuration"
        case baseUrl    = "Base URL"
        case apiKey     = "Api Key"
    }
    
    //MARK: - Private configuration accessors
    private static var configDict: JSON {
        guard let plistPath = Bundle.main.path(forResource: ConfigurationKey.configDict.rawValue, ofType: "plist") else { return [:] }
        return NSDictionary(contentsOfFile: plistPath) as? JSON ?? [:]
    }
    
    private static func getTargetConfigString(for key: ConfigurationKey) -> String {
        return AppConfiguration.configDict[key.rawValue] as? String ?? ""
    }
    
    //MARK: - Base url
    static var baseUrl: String {
        return getTargetConfigString(for: .baseUrl)
    }

    static var weatherApiKey: String {
        return getTargetConfigString(for: .apiKey)
    }
}
