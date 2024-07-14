//
//  NavigationViewModel.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 05.07.2024.
//

import Foundation
import SwiftUI

class NavigationViewModel: ObservableObject {
    @Published var articlesStack = NavigationPath()
    
    func push(newScreen: Screen) {
        articlesStack.append(newScreen)
    }

    func skip(howMuch: Int = 1) {
        articlesStack.removeLast(howMuch)
    }
    
    func popToRoot() {
        articlesStack.removeLast(articlesStack.count)
    }
}

