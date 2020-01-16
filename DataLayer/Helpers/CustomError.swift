//
//  CustomError.swift
//  DataLayer
//
//  Created by Florin Uscatu on 15/01/2020.
//  Copyright © 2020 Florin Uscatu. All rights reserved.
//

import Foundation

enum CustomError: Error {
    case general
    case network
}

extension CustomError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .general: return NSLocalizedString("Something went wrong", comment: "General Error")
        case .network: return NSLocalizedString("There was a problem with the network", comment: "Network Error")
        }
    }
}
