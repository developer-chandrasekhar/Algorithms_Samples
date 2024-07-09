//
//  APIUrlStrings.swift
//  Network
//
//  Created by Chandra Sekhar P V on 01/09/23.
//

import Foundation

class URLStrings {
    static let shared = URLStrings()
    private init() {
//        let currentConfiguration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as! String
//        environment = Environment(rawValue: currentConfiguration)!
//    https://sarunw.com/posts/how-to-set-up-ios-environments/
    }
    // based on Environment variable we should decide base url
    //    let environment: Environment
    //    init(environment: Environment = .development) {
    //        self.environment = environment
    //    }
    
    var baseURL: String {
        return "https://api.escuelajs.co/api/v1/"
    }
}

extension URLStrings {
    private static let baseURL = shared.baseURL
    static let productList = baseURL + "products"
}

