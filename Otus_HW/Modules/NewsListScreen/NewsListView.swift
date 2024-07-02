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
    @State private var animatingIndex: Int? = nil
    
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
                        ForEach(viewModel.news.indices) { index in
                            let article = viewModel.news[index]
                                NewsCell(
                                    title: article.title ?? "Title",
                                    description: article.description ?? "Empty description"
                                )
                                
                                .rotationEffect(.degrees(animatingIndex != index ? 0 : -45))
                                .offset(
                                    x: animatingIndex == index ? fullView.size.width / 2 - 25 : 0,
                                    y: animatingIndex == index ? fullView.size.height / 2 - 25 : 0
                                )
                                .scaleEffect(animatingIndex != index ? 1 : 0.1)
                                .onTapGesture {
                                    withAnimation(.linear(duration: 0.5)) {
                                        animatingIndex = index
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        viewModel.removeRow(at: index)
                                        animatingIndex = nil
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
