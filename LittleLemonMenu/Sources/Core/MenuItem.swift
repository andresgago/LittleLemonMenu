//
//  MenuItem.swift
//  LittleLemonMenu
//
//  Created by Andres Gago Alonso on 15/09/25.
//

import Foundation

final class MenuItem: MenuItemProtocol, Identifiable, Hashable {
    let id: UUID

    let title: String
    let category: MenuCategory

    var ordersCount: Int
    var priceInt: Int
    var ingredients: [Ingredient]

    var price: Double { Double(priceInt) }

    init(id: UUID = UUID(),
         title: String,
         category: MenuCategory,
         ordersCount: Int,
         priceInt: Int,
         ingredients: [Ingredient]) {
        self.id = id
        self.title = title
        self.category = category
        self.ordersCount = ordersCount
        self.priceInt = priceInt
        self.ingredients = ingredients
    }

    convenience init(title: String,
                     category: MenuCategory,
                     price: Double,
                     ordered: Int,
                     ingredients: [Ingredient]) {
        self.init(title: title,
                  category: category,
                  ordersCount: ordered,
                  priceInt: Int(price.rounded()),
                  ingredients: ingredients)
    }

    var ordered: Int {
        get { ordersCount }
        set { ordersCount = newValue }
    }

    static func == (lhs: MenuItem, rhs: MenuItem) -> Bool { lhs.id == rhs.id }
    func hash(into hasher: inout Hasher) { hasher.combine(id) }
}
