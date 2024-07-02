//
//  NewsCell.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 01.07.2024.
//

import SwiftUI

struct NewsCell: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
            Text(description)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}

#Preview {
    NewsCell(
        title: "Title",
        description: "Lorem ipsum"
    )
}
