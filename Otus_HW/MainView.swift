//
//  ContentView.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 13.06.2024.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0
    @State private var selectedItemIndex: Int? = nil
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ButtonForNavigationView(
                selectedTab: $selectedTab,
                selectedItemIndex: $selectedItemIndex
            )
            .tabItem {
                Image(systemName: "n.circle")
                Text("Button to List")
            }
            .tag(0)
            
            NavigationView {
                ListView(selectedItemIndex: $selectedItemIndex)
            }
            .tabItem {
                Image(systemName: "list.bullet.circle")
                Text("List")
            }
            .tag(1)
            
            ModalPerformerView()
                .tabItem {
                    Image(systemName: "arrow.up.doc.on.clipboard")
                    Text("Modal perform")
                }
                .tag(2)
        }
    }
}

#Preview {
    MainView()
}
