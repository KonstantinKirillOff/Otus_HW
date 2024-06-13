//
//  ButtonForNavigationView.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 13.06.2024.
//

import SwiftUI

struct ButtonForNavigationView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Screen for navigation to list item")
                Button("To list item") {
                    print("navigate")
                }
            }
            .navigationTitle("Tap navigator")
        }
    }
}

#Preview {
    ButtonForNavigationView()
}
