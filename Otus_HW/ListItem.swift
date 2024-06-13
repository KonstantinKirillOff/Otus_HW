//
//  ListItem.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 13.06.2024.
//

import Foundation

struct ListItem: Identifiable {
    let id = UUID()
    let name: String
    
    static func getItemsForList() -> [ListItem] {
        return [
            ListItem(name: "Task 1"),
            ListItem(name: "Task 2"),
            ListItem(name: "Task 3"),
            ListItem(name: "Task 4"),
            ListItem(name: "Task 5"),
            ListItem(name: "Task 6")
        ]
    }
}
