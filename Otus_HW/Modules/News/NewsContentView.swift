//
//  NewsContentView.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 05.07.2024.
//

import SwiftUI

struct NewsContentView: View {
    @EnvironmentObject var navigationViewModel: NavigationViewModel
    let article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(article.content ?? "")
                Spacer()
            }
        }
        .padding()
        .navigationTitle("Content")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Root") {
                    navigationViewModel.popToRoot()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Skip 1") {
                    navigationViewModel.skip(howMuch: 1)
                }
            }
        }
    }
}

#Preview {
    NewsContentView(article: Article(url: "", content: "Content "))
}
