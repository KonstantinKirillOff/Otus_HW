//
//  ListView.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 13.06.2024.
//

import SwiftUI

struct ListView: View {
    @State private var selectedItem: ListItem?
    @State private var listItems = [ListItem]()
    @State private var isLinkActive = false
    
    @Binding var selectedItemIndex: Int?
    
    var body: some View {
        List(listItems) { item in
            Button(item.name) {
                selectedItem = item
                isLinkActive = true
            }
        }
        .navigationTitle("Task List")
        .listStyle(.plain)
        .background(
            NavigationLink(
                destination: DetailView(item: selectedItem),
                isActive: $isLinkActive) {
                EmptyView()
            }
        )
        .onAppear() {
            //DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            listItems = ListItem.getItemsForList()
            if let selectedItemIndex = selectedItemIndex {
                selectedItem = listItems[selectedItemIndex]
                isLinkActive = true
            }
            //}
        }
        
    }
}

//#Preview {
//    ListView(
//        selectedItem: nil,
//        listItems: .cons,
//        isLinkActive: <#T##arg#>,
//        selectedItemIndex: Int?
//    )
//}
