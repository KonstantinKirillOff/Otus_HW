//
//  NewsListViewModel.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 27.06.2024.
//

import Foundation

class NewsListViewModel: ObservableObject {
    @Published var news: [Article] = []
    
    private var canLoad = true
    private var currentPage = 1
    private var totalResults = 100
    private let pageSize = 100
    
    func loadArticles() {
        guard currentPage * 100 <= totalResults else { return }
        guard canLoad else { return }
        
        canLoad = false
        
        Task { @MainActor in
            let result = try? await ArticlesAPI.everythingGet(
                q: "Tesla",
                from: "2024",
                sortBy: "publishedAt",
                language: "en",
                apiKey: Key.News.newsApi,
                page: currentPage
            )
            
            if let resultArticlesList = result {
                let articles = resultArticlesList.articles ?? []
                totalResults = resultArticlesList.totalResults
                
                news.append(contentsOf: articles)
                currentPage += 1
            }
        }
    }
}
