//
//  SegmentedControl.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 05.07.2024.
//

import SwiftUI

struct SegmentedControl: View {
    @Binding var selectedSegment: String
    
    var body: some View {
        Picker("", selection: $selectedSegment) {
            ForEach(NewsListViewModel.NewsSections.allCases, id: \.self) { newsSection in
                Text(newsSection.rawValue).tag(newsSection.rawValue)
            }
        }
        .pickerStyle(.segmented)
        .padding(.horizontal)    }
}

#Preview {
    SegmentedControl(selectedSegment: .constant("new iphone 16"))
}
