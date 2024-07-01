//
//  NewsListView.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 01.07.2024.
//

import SwiftUI

struct NewsListView: View {
    @StateObject var viewModel = NewsListViewModel()
    
    var body: some View {
        VStack {
            Text("Fake news")
                .font(.largeTitle)
            List {
                ForEach(viewModel.news) { article in
                    NewsCell(
                        title: article.title ?? "Title",
                        description: article.description ?? "Empty description"
                    )
                    .onAppear {
                        if viewModel.news.needToLoad(article) {
                            viewModel.loadArticles()
                        }
                    }
                    .listRowSeparator(.hidden)
                    Divider()
                        .background(Color.black)
                }
            }
            .listStyle(.inset)
            .onAppear {
                viewModel.loadArticles()
            }
        }
    }
}

#Preview {
    NewsListView()
}
