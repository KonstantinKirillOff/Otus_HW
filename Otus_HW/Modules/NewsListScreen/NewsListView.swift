//
//  NewsListView.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 01.07.2024.
//

import SwiftUI

struct NewsListView: View {
    @StateObject var viewModel = NewsListViewModel()
    @State private var selectedSegment = "Iphone 16"
    
    var body: some View {
        VStack {
            Text("Fake news")
                .font(.largeTitle)
            Picker("", selection: $selectedSegment) {
                ForEach(NewsListViewModel.NewsSections.allCases, id: \.self) { newsSection in
                    Text(newsSection.rawValue).tag(newsSection.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            .onChange(of: selectedSegment) { oldValue, newValue in
                if let enumValue = NewsListViewModel.NewsSections(rawValue: newValue) {
                    viewModel.sectionDidChange(section: enumValue)
                }
            }
            
            if viewModel.isLoading {
                Spacer()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                    .scaleEffect(2)
                Spacer()
            } else {
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
            }
        }
        .onAppear {
            viewModel.loadArticles()
        }
    }
}

#Preview {
    NewsListView()
}
