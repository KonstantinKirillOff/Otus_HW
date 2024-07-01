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
    private var paginationStates: [NewsSections : PaginationState] = [:]
    
    func loadArticles() {
        let stateForSection: PaginationState
        if let state = paginationStates[newsSection] {
            stateForSection = state
        } else {
            stateForSection = PaginationState(
                currentPage: 1,
                totalResults: 100,
                pageSize: 20
            )
        }
        guard stateForSection.currentPage * 100 <= stateForSection.totalResults else { return }
        guard canLoad else { return }
        
        canLoad = false
        isLoading = true
        Task { @MainActor in
            let result = try? await ArticlesAPI.everythingGet(
                q: newsSection.rawValue,
                from: "2024",
                sortBy: "publishedAt",
                language: "en",
                apiKey: Key.News.newsApi,
                pageSize: stateForSection.pageSize,
                page: stateForSection.currentPage
            )
            
            if let resultArticlesList = result {
                let articles = resultArticlesList.articles ?? []
                
                var updatedState = stateForSection
                updatedState.news.append(contentsOf: articles)
                updatedState.currentPage += 1
                paginationStates[newsSection] = updatedState
                
            } else {
                print("Error")
            }
            canLoad = true
            isLoading = false
        }
    }
    
    func sectionDidChange(section: NewsSections) {
        newsSection = section
        loadArticles()
    }
    
    enum NewsSections: String, Hashable, CaseIterable {
        case iphone = "Iphone 16"
        case newFilms = "New cinema 2024"
        case dollar = "Dollar rate"
    }
    
    struct PaginationState {
        var currentPage: Int
        var totalResults: Int
        let pageSize: Int
        
        var news: [Article] = []
    }
}
