//
//  NewsListView.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 01.07.2024.
//


import SwiftUI

struct NewsListView: View {
    @EnvironmentObject var navigationViewModel: NavigationViewModel
    @StateObject var viewModel = NewsListViewModel()
    
    @State private var selectedSegment = "new iphone 16"
    @State private var animatingId: String? = nil
    
    var body: some View {
        NavigationStack(path: $navigationViewModel.articlesStack) {
            GeometryReader { fullView in
                VStack {
                    SegmentedControl(selectedSegment: $selectedSegment)
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
                                        DispatchQueue.main.asyncAfter(deadline: .now() +  0.5) {
                                            let detailsScreen = Screen(
                                                id: UUID().uuidString,
                                                viewBuilder: { AnyView(NewsDetailsView(article: article)) }
                                            )
                                            let contentScreen = Screen(
                                                id: UUID().uuidString,
                                                viewBuilder: { AnyView(NewsContentView(article: article)) }
                                            )
                                            navigationViewModel.push(newScreen: detailsScreen)
                                            navigationViewModel.push(newScreen: contentScreen)
                                            
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
                        .navigationDestination(for: Screen.self) { screen in
                            screen.viewBuilder()
                        }
                    }
                }
                .navigationTitle("Fake news")
                .onAppear {
                    viewModel.loadArticles()
                }
            }
        }
    }
}

#Preview {
    NewsListView()
}
