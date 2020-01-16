//
//  RequestType.swift
//  NetworkLayer
//
//  Created by Florin Uscatu on 16/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation

enum RequestType {
    case people(page: Int)
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "swapi.co/api"
        
        switch self {
        case .people(let page):
            components.path = "/people"
            components.queryItems = [URLQueryItem(name: "page", value: "\(page)")]
        }
        
        return components.url
    }
    
}
