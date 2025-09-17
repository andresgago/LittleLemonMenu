//
//  MenuViewViewModel.swift
//  LittleLemonMenu
//
//  Created by Andres Gago Alonso on 15/09/25.
//

import Foundation

final class MenuViewViewModel: ObservableObject {
    @Published var foodItems: [MenuItem]
    @Published var drinkItems: [MenuItem]
    @Published var dessertItems: [MenuItem]

    // ✔️ estado para filtros/sort
    @Published var selectedCategories: Set<MenuCategory> = Set(MenuCategory.allCases)
    @Published var sort: SortOption = .popular

    @Published var errorMessage: String?

    init(foodItems: [MenuItem] = MockMenuData.food,
         drinkItems: [MenuItem] = MockMenuData.drinks,
         dessertItems: [MenuItem] = MockMenuData.desserts) {
        self.foodItems = foodItems
        self.drinkItems = drinkItems
        self.dessertItems = dessertItems

        do { try validate() }
        catch {
            self.errorMessage = (error as? LocalizedError)?.errorDescription ?? error.localizedDescription
        }
    }

    private func validate() throws {
        if foodItems.count != 12 { throw MenuDataError.wrongCount(category: "Food", expected: 12, got: foodItems.count) }
        if drinkItems.count != 8 { throw MenuDataError.wrongCount(category: "Drink", expected: 8, got: drinkItems.count) }
        if dessertItems.count != 4 { throw MenuDataError.wrongCount(category: "Dessert", expected: 4, got: dessertItems.count) }
    }
}

extension MenuViewViewModel: MenuOptionsDelegate {
    func didUpdateFilters(categories: Set<MenuCategory>, sort: SortOption) {
        selectedCategories = categories
        self.sort = sort
    }
}
