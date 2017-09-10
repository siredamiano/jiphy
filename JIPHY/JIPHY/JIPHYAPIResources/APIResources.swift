//
//  APIResources.swift
//  JIPHY
//
//  Created by Damian A Torres on 9/9/17.
//  Copyright © 2017 Damian A Torres. All rights reserved.
//

import Foundation

struct APIWrapper {
    let data: [Serialization]
    let pagination: Pagination?
    let meta: Meta?
}

extension APIWrapper {
    private enum Keys: String, SerializationKey {
        case data
        case pagination
        case meta
    }
    
    init(serialization: Serialization) {
        data = serialization.value(forKey: Keys.data) ?? []
        if let paginationSerialization: Serialization = serialization.value(forKey: Keys.pagination) {
            pagination = Pagination(serialization: paginationSerialization)
        } else {
            pagination = nil
        }
        if let metaSerialization: Serialization = serialization.value(forKey: Keys.meta) {
            meta = Meta(serialization: metaSerialization)
        } else {
            meta = nil
        }
    }
}

protocol APIResource {
    associatedtype Model
    var methodPath: String { get }
    var parameters: String { get }
    func makeModel(serialization: Serialization) -> Model
}

extension APIResource {

    var url: URL {
        let baseURL = "https://api.giphy.com/v1/gifs"
        let apiKey = "264115c00a1944a4a8cf1510f1a295e6"
        let apiKeyParam = "api_key=\(apiKey)"
        let url = "\(baseURL)\(methodPath)?\(apiKeyParam)&\(parameters)"
        return URL(string:url)!
    }
    
    func makeModel(data: Data)  -> [Model]? {
        guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {
            return nil
        }
        guard let jsonSerialization = json as? Serialization else {
            return nil
        }
        let wrapper = APIWrapper(serialization: jsonSerialization)
        return wrapper.data.map(makeModel(serialization:))
    }
    
}

struct TrendingResource: APIResource {
    let methodPath = "/trending"
    let parameters = ""
    
    func makeModel(serialization: Serialization) -> GIF {
        return GIF(serialization: serialization)
    }
}

struct SearchResource: APIResource {
    let methodPath = "/search"
    let query: String
    
    init(query: String) {
        self.query = query.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    }
    
    var parameters: String {
        return "q=\(self.query)"
    }
    
    func makeModel(serialization: Serialization) -> GIF {
        return GIF(serialization: serialization)
    }
}

