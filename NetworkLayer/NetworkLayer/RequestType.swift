//
//  RequestType.swift
//  NetworkLayer
//
//  Created by Florin Uscatu on 16/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation

public enum RequestType {
    case people(page: Int)
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "swapi.co"
        
        switch self {
        case .people(let page):
            components.path = "/api/people"
            components.queryItems = [URLQueryItem(name: "page", value: "\(page)")]
        }
        
        return components.url
    }
    
}
