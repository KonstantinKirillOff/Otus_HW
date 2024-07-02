//
//  NewsListViewModel.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 27.06.2024.
//

import Foundation

class NewsListViewModel: ObservableObject {
    @Published var news: [Article] = []
    @Published var isLoading = false
    
    private var newsSection: NewsSections = .iphone

    private var canLoad = true
    private var currentPage = 1
    private var totalResults = 1000
    private let pageSize = 20
    
    func loadArticles() {
        guard currentPage * 100 <= totalResults else { return }
        guard canLoad else { return }
        
        canLoad = false
        isLoading = news.count == 0
        Task { @MainActor in
            let result = try? await ArticlesAPI.everythingGet(
                q: newsSection.rawValue,
                from: "2024",
                sortBy: "publishedAt",
                language: "en",
                apiKey: Key.News.newsApi,
                pageSize: pageSize,
                page: currentPage
            )
            
            if let resultArticlesList = result {
                let articles = resultArticlesList.articles ?? []
                currentPage += 1
                totalResults = resultArticlesList.totalResults
                news.append(contentsOf: articles)
            } else {
                print("Error")
            }
            canLoad = true
            isLoading = false
        }
    }
    
    func sectionDidChange(section: NewsSections) {
        newsSection = section
        news = []
        currentPage = 1
        totalResults = 1000
        loadArticles()
    }
    
    func removeRow(at index: Int) {
        news.remove(at: index)
    }
    
    enum NewsSections: String, Hashable, CaseIterable {
        case iphone = "new iphone 16"
        case marvelFilms = "Marvel"
    }
}
