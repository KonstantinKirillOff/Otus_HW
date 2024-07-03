//
//  NewsListView.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 01.07.2024.
//


import SwiftUI

struct NewsListView: View {
    @StateObject var viewModel = NewsListViewModel()
    @State private var selectedSegment = "new iphone 16"
    @State private var animatingId: String? = nil
    
    var body: some View {
        GeometryReader { fullView in
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
                    if let newEnumValue = NewsListViewModel.NewsSections(rawValue: newValue) {
                        viewModel.sectionDidChange(section: newEnumValue)
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
                                let isAnimatingElement = (animatingId == article.id)
                                NewsCell(
                                    title: article.title ?? "Title",
                                    description: article.description ?? "Empty description"
                                )
                                
                                .rotationEffect(.degrees(isAnimatingElement ? -45 : 0))
                                .offset(
                                    x: isAnimatingElement ? fullView.size.width / 2 - 25 : 0,
                                    y: isAnimatingElement ? fullView.size.height / 2 - 25 : 0
                                )
                                .scaleEffect(isAnimatingElement ? 0.1 : 1)
                                .onTapGesture {
                                    withAnimation(.linear(duration: 0.5)) {
                                        animatingId = article.id
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        viewModel.removeRow(at: article.id)
                                        animatingId = nil
                                    }
                                }
                                .onAppear {
                                    if viewModel.news.needToLoad(article) {
                                        viewModel.loadArticles()
                                    }
                                }
                                .listRowSeparator(.hidden)
                        }
                        
                    }
                    .listStyle(.plain)
                }
            }
            .onAppear {
                viewModel.loadArticles()
            }
        }
    }
}

#Preview {
    NewsListView()
}
