//
//  ModalView.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 13.06.2024.
//

import SwiftUI

struct ModalView: View {
    var body: some View {
        VStack {
            Text("Is modal view")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
    }
}

#Preview {
    ModalView()
}
