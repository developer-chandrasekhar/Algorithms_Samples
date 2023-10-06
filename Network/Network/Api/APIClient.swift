//
//  HTTPClient.swift
//  Network
//
//  Created by Chandra Sekhar P V on 31/08/23.
//

import Foundation

protocol HTTPClient {
    func connect(for request: URLRequest) async throws -> (Data, HTTPURLResponse)
}

extension URLSession: HTTPClient {
    func connect(for request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        let result = try await URLSession.shared.data(for: request)
        guard let httpResponse = result.1 as? HTTPURLResponse else {
            throw ApiError.invalidResponse
        }
        return (result.0, httpResponse)
    }
}

protocol ProductService {
    func getAllProducts() async throws -> Products
}

class ProductWebService: ProductService {
    
    let client: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.client = httpClient
    }
    
    func getAllProducts() async throws -> Products {
        let urlStr = "https://api.escuelajs.co/api/v1/products"
        let request = URLRequest(url: URL(string: urlStr)!)
        do {
            let response = try await client.connect(for: request)
            let products = try GenericDecoder<Products>().decode(data: response.0)
            return products
        } catch(let error) {
            throw error
        }
    }
}





