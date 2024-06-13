//
//  ListView.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 13.06.2024.
//

import SwiftUI

struct ListView: View {
    @State private var selectedItem: ListItem?
    @State private var isLinkActive = false
    @State private var listItems = [ListItem]()
    @State private var isLoading = true
    
    @Binding var selectedItemIndex: Int?
    
    var body: some View {
        ZStack {
            Spinner(isAnimating: isLoading, style: .large)
            List(listItems) { item in
                Button(item.name) {
                    self.selectedItem = item
                    self.isLinkActive = true
                }
            }
            .navigationTitle("Task List")
            .listStyle(.plain)
        }
        .background(
            NavigationLink(
                destination: DetailView(item: selectedItem),
                isActive: $isLinkActive) {
                    EmptyView()
                }
        )
        .onAppear() {
            self.listItems = ListItem.getItemsForList()
            self.isLoading = false
            
            if let selectedItemIndex = selectedItemIndex  {
                self.selectedItem = listItems[selectedItemIndex]
                self.isLinkActive = true
            }
        }
        
    }
}

#Preview {
    ListView(selectedItemIndex: .constant(0))
}
