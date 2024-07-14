//
//  InjectedWrapper.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 14.07.2024.
//

import Foundation
import SwiftUI

@propertyWrapper
struct Injected<T: Any> {
    private var service: T?
    private weak var serviceLocator = ServiceLocator.shared
    
    var wrappedValue: T? {
        mutating get {
            if service == nil {
                service = serviceLocator?.resolve(serviceType: T.self)
            }
            return service
        }
        
        mutating set {
            service = newValue
        }
    }
    
    public var projectedValue: Injected<T> {
        get { self }
        mutating set {
            self = newValue
        }
    }
}
