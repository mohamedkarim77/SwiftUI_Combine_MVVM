//
//  APIError.swift
//  SwiftUI_Combine_MVVM
//
//  Created by Mohamed Abdelkarim on 05/09/2022.
//

import Foundation

enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
    
}

extension APIError: LocalizedError {
    var errorDescription: String?{
        switch self {
        case .decodingError:
            return "Failed to decode object"
        case .errorCode(let code):
            return "Error code is: \(code)"
        case .unknown:
            return "This error is unknown"
        }
    }
}
