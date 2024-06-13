//
//  ModalView.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 13.06.2024.
//

import SwiftUI

struct ModalPerformerView: View {
    @State private var isShowModal = false
    
    var body: some View {
        VStack {
            Text("Screen for demonstrate show modal")
            Button("Open modal") {
                isShowModal.toggle()
            }
        }.sheet(isPresented: $isShowModal, content: {
            ModalView()
        })
    }
}

#Preview {
    ModalPerformerView()
}
