//
//  ApiRequest.swift
//  Network
//
//  Created by Chandra Sekhar P V on 01/09/23.
//

import Foundation

typealias URLRequestPayload = [String: Encodable]

protocol ApiRequest {
    func prepareRequest<T: EndPoint>(endPoint: T) throws -> URLRequest
}

extension ApiRequest {
    func prepareBaseRequest<T: EndPoint>(endPoint: T) throws -> URLRequest {
        guard let escapedUrlString = endPoint.urlString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
              let url = URL(string: escapedUrlString) else {
            throw ApiError.badUrl
        }
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.httpMethod
        request.setValue(endPoint.requestContentType, forHTTPHeaderField: "Content-Type")
        request.setValue(endPoint.responseContentType, forHTTPHeaderField: "Accept")
        return request
    }
}

class ApiGetRequest: ApiRequest {
    func prepareRequest<T: EndPoint>(endPoint: T) throws -> URLRequest {
        do{
            return try self.prepareBaseRequest(endPoint: endPoint)
        } catch(let error) {
            throw error
        }
    }
}

class ApiPostRequest: ApiRequest {
    
    let payload: Encodable
    
    init(payload: Encodable) {
        self.payload = payload
    }
    
    func prepareRequest<T: EndPoint>(endPoint: T) throws -> URLRequest {
        do{
            var request = try self.prepareBaseRequest(endPoint: endPoint)
            let encodedPayload = try JSONEncoder().encode(payload)
            request.httpBody = encodedPayload
            return request
        }
        catch(let error as ApiError) {
            throw error
        }
        catch( _ as EncodingError) {
            throw ApiError.encodingError
        }
    }
}
