//
//  MockMenuData.swift
//  LittleLemonMenu
//
//  Created by Andres Gago Alonso on 15/09/25.
//

import Foundation

enum MockMenuData {
    static let food: [MenuItem] = (1...12).map { i in
        MenuItem(
            title: "Food \(i)",
            category: .food,
            price: 8.99 + Double(i % 3),
            ordered: 1000 - i * 7,
            ingredients: [.spinach, .broccoli, .carrot, .pasta]
        )
    }

    static let drinks: [MenuItem] = (1...8).map { i in
        MenuItem(
            title: "Drink \(i)",
            category: .drink,
            price: 3.49 + Double(i % 2),
            ordered: 800 - i * 5,
            ingredients: [.tomatoSauce]
        )
    }

    static let desserts: [MenuItem] = (1...4).map { i in
        MenuItem(
            title: "Dessert \(i)",
            category: .dessert,
            price: 6.49 + Double(i % 2),
            ordered: 500 - i * 3,
            ingredients: [.carrot, .pasta]
        )
    }

    static let all: [MenuItem] = food + drinks + desserts
}

enum MockDataError: Error { case wrongCount }
extension MockMenuData {
    static func validate() throws {
        guard food.count == 12, drinks.count == 8, desserts.count == 4 else {
            throw MockDataError.wrongCount
        }
    }
}
