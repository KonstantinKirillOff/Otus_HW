//
//  ContentView.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 13.06.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            TabView {
                ButtonForNavigationView()
                    .tabItem {
                        Image(systemName: "n.circle")
                        Text("Button to List")
                    }
                
                ListView()
                    .tabItem {
                        Image(systemName: "list.bullet.circle")
                        Text("List")
                    }
                
                ModalPerformerView()
                    .tabItem {
                        Image(systemName: "arrow.up.doc.on.clipboard")
                        Text("Modal perform")
                    }
            }
        }
    }
}

#Preview {
    MainView()
}
