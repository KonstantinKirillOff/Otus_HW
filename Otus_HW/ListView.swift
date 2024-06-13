//
//  ListView.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 13.06.2024.
//

import SwiftUI

struct ListView: View {
    @State private var listItems = [ListItem]()
    
    var body: some View {
        NavigationView {
            List(listItems) { item in
                NavigationLink {
                    DetailView()
                } label: {
                    Text(item.name)
                }
            }
            .navigationTitle("Task List")
        }
        .listStyle(.plain)
        .task {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                listItems = ListItem.getItemsForList()
            }
        }
        
    }
}

#Preview {
    ListView()
}
