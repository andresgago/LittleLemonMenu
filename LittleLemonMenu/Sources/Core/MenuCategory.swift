//
//  MenuCategory.swift
//  LittleLemonMenu
//
//  Created by Andres Gago Alonso on 15/09/25.
//

import Foundation

enum MenuCategory: String, CaseIterable, Identifiable {
    case food = "Food"
    case drink = "Drink"
    case dessert = "Dessert"
    var id: Self { self }
}
