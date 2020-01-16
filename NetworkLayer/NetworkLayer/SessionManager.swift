//
//  SessionManager.swift
//  NetworkLayer
//
//  Created by Florin Uscatu on 16/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation
import Common

class SessionManager {
    
    func request<T: Codable>(type _: T.Type, requestType: RequestType, completion handler: @escaping (Result<T, Error>) -> Void) {
        guard let url = requestType.url else {
            handler(Result.failure(CustomError.network))
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200,
                let data = data
                else {
                    handler(Result.failure(CustomError.network))
                    return
            }
            guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
                handler(Result.failure(CustomError.network))
                return
            }
            handler(Result.success(decodedResponse))
        }.resume()
    }
}
