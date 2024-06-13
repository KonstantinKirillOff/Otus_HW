//
//  ActivityIndicator.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 13.06.2024.
//

import UIKit
import SwiftUI

struct Spinner: UIViewRepresentable {
    let isAnimating: Bool
    let style: UIActivityIndicatorView.Style
   
    func makeUIView(context: UIViewRepresentableContext<Spinner>) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: style)
        return activityIndicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Spinner>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
