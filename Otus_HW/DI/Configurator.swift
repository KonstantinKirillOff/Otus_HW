//
//  Configurator.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 14.07.2024.
//

import Foundation

final class Configurator {
    static let shared = Configurator()
    private let serviceLocator = ServiceLocator.shared
    
    func register() {
        serviceLocator.register(service: ArticlesAPI())
    }
    
    private init() { }
}
