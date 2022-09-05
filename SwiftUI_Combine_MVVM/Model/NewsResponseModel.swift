//
//  NewsModel.swift
//  SwiftUI_Combine_MVVM
//
//  Created by Mohamed Abdelkarim on 02/09/2022.
//

import Foundation

// MARK: - Users
struct NewsResponseModel: Codable {
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    let author: String?
    let url: String?
    let source, title, articleDescription: String?
    let image: String?
    let date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}
