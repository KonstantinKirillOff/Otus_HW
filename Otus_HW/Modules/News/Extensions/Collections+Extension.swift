//
//  Collections+Extension.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 27.06.2024.
//

import Foundation

extension RandomAccessCollection where Self.Element: Identifiable {
    func needToLoad<Item:  Identifiable>(_ element: Item) -> Bool {
        guard isEmpty == false else { return false }
        guard let itemIndex = firstIndex(where: { AnyHashable($0.id) == AnyHashable(element.id) } ) else {
            return false
        }
        let distance = distance(from: itemIndex, to: endIndex)
        return distance == 2
    }
}
