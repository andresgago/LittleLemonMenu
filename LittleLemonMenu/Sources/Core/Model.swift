//
//  Model.swift
//  LittleLemonMenu
//
//  Created by Andres Gago Alonso on 15/09/25.
//

import Foundation

enum SortOption: String, CaseIterable, Identifiable {
    case popular = "Most Popular"
    case price   = "Price $-$$$"
    case name    = "A-Z"
    var id: Self { self }
}
