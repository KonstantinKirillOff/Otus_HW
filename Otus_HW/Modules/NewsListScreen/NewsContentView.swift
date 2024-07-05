//
//  NewsContentView.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 05.07.2024.
//

import SwiftUI

struct NewsContentView: View {
    let article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(article.content ?? "")
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    NewsContentView(article: Article(url: "", content: "Content "))
}
