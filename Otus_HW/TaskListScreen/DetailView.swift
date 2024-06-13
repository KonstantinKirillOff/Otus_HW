//
//  DetailView.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 13.06.2024.
//

import SwiftUI

struct DetailView: View {
    let item: ListItem?
    
    var body: some View {
        VStack {
            Image(systemName: "filemenu.and.cursorarrow")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Detail view for \(item?.name ?? "error")")
                .navigationTitle(item?.name ?? "error")
        }
        .padding()
    }
}

#Preview {
    DetailView(item: nil)
}
