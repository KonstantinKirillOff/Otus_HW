//
//  NewsDetailsView.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 05.07.2024.
//

import SwiftUI

struct NewsDetailsView: View {
    let article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                Text(article.title ?? "")
                    .font(.title)
                    .fontWeight(.bold)
                Text(article.description ?? "")
                    .lineLimit(nil)
                Spacer()
                HStack {
                    Text(article.author ?? "Author")
                    Text(article.publishedAt ?? "")
                }
            }
        }
        .padding(.horizontal)
        .navigationTitle("Description")
    }
}

#Preview {
    NewsDetailsView(article: Article(
        author: "Kirillov K.", 
        title: "Title",
        description: """
        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
        """,
        url: "",
        publishedAt: "2024-05-07"
    ))
}
