//
//  ScreenModel.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 05.07.2024.
//

import Foundation
import SwiftUI

struct Screen: Equatable, Hashable {
    let id: String
    let viewBuilder: () -> AnyView

    static func == (lhs: Screen, rhs: Screen) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
