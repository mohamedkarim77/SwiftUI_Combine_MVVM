//
//  NewsViewModel.swift
//  SwiftUI_Combine_MVVM
//
//  Created by Mohamed Abdelkarim on 05/09/2022.
//

import Foundation
import Combine

protocol NewsViewModelProtocol {
    func getArticles ()
}


class NewsViewModel: ObservableObject, NewsViewModelProtocol {
    
    private var service = NewsService()
    
    init(service: NewsService) {
        self.service = service
    }
    
    private(set) var articles = [Article]()
    private var cancellables = Set<AnyCancellable>()
    @Published private(set) var state: ResultState = .loading
    
    func getArticles() {
        state = .loading
        let cancellable = service
                            .newsServiceRequest(from: .getNews)
                            .sink { res in
                                switch res {
                                case .finished:
                                    self.state = .success(content: self.articles)
                                case .failure(let error):
                                    self.state = .failed(error: error)
                                }
                            } receiveValue: { response in
                                self.articles = response.articles!
                            }
        self.cancellables.insert(cancellable)

    }
    
}
