import XCTest
@testable import LittleLemonMenu

final class MenuItemTests: XCTestCase {

    func test_menuItemTitle_setsInitializedValue() {
        let item = MenuItem(
            title: "Margherita Pizza",
            category: .food,
            price: 12.0,
            ordered: 0,
            ingredients: [.tomatoSauce, .pasta]
        )
        XCTAssertEqual(item.title, "Margherita Pizza")
    }

    func test_menuItemIngredients_setsInitializedValue() {
        let ings: [Ingredient] = [.spinach, .broccoli, .carrot]
        let item = MenuItem(
            title: "Veggie Bowl",
            category: .food,
            price: 9.5,
            ordered: 0,
            ingredients: ings
        )
        XCTAssertEqual(item.ingredients, ings)
    }
}
