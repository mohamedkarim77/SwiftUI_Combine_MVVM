//
//  EndPOint.swift
//  SwiftUI_Combine_MVVM
//
//  Created by Mohamed Abdelkarim on 05/09/2022.
//

import Foundation

protocol ApiBuilderProtocol {
    var baseURL: URL { get }
    var path: String { get }
    var urlRequest: URLRequest { get }
      
}

enum NewsAPI {
    case getNews
}

extension NewsAPI: ApiBuilderProtocol {
    
    var baseURL: URL {
        switch self {
        case .getNews:
            return URL(string: "https://lil.software")!
        }
    }
    var path: String {
        return "/news"
    }
    var urlRequest: URLRequest {
        return URLRequest(url: baseURL.appendingPathComponent(path))
    }

}
