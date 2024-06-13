//
//  ButtonForNavigationView.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 13.06.2024.
//

import SwiftUI

struct ButtonForNavigationView: View {
    @Binding var selectedTab: Int
    @Binding var selectedItemIndex: Int?
    
    var body: some View {
        VStack {
            Text("Screen for navigation to list item")
            Button("To list item") {
                selectedTab = 1
                selectedItemIndex = (0..<6).randomElement()
            }
        }
    }
}

#Preview {
    ButtonForNavigationView(
        selectedTab: .constant(1),
        selectedItemIndex: .constant(nil)
    )
}
