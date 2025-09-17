//
//  MenuItemProtocol.swift
//  LittleLemonMenu
//
//  Created by Andres Gago Alonso on 15/09/25.
//

import Foundation

protocol MenuItemProtocol {
    var id: UUID { get }
    var price: Double { get }
    var title: String { get }
    var category: MenuCategory { get }

    var ordersCount: Int { get set }
    var priceInt: Int { get set }
    var ingredients: [Ingredient] { get set }
}
