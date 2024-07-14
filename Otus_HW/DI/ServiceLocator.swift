//
//  ServiceLocator.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 14.07.2024.
//

import Foundation

final class ServiceLocator {
    static let shared = ServiceLocator()
    private var services: [String : Any] = [:]
    
    func register<T: Any>(service: T) {
        let serviceName = String(describing: T.self)
        if services[serviceName] == nil {
            services[serviceName] = service
        }
    }
    
    func resolve<T: Any>(serviceType: T.Type) -> T? {
        let serviceName = String(describing: T.self)
        return services[serviceName] as? T
    }
    
    private init() {}
}
