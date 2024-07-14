//
//  Otus_HWApp.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 13.06.2024.
//

import SwiftUI

@main
struct Otus_HWApp: App {
    
    init() {
        Configurator.shared.register()
    }
    
    var body: some Scene {
        WindowGroup {
            NewsListView()
                .environmentObject(NavigationViewModel())
        }
    }
}
