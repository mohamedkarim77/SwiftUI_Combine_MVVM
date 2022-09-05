//
//  HomeView.swift
//  SwiftUI_Combine_MVVM
//
//  Created by Mohamed Abdelkarim on 02/09/2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = NewsViewModel(service: NewsService())
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .success(let articles):
                NavigationView {
                    List(articles) { article in
                        ArticleView(article: article)
                    }
                    .navigationTitle(Text("News"))
                }
            case .failed(let error):
                ErrorView(error: error, handler: viewModel.getArticles)
            }
        }.onAppear {
            viewModel.getArticles()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
