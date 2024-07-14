//
//  Article+Extension.swift
//  Otus_HW
//
//  Created by Konstantin Kirillov on 27.06.2024.
//

import Foundation

extension Article: Identifiable {
    public var id: String  { url }
}
