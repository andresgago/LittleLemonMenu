//
//  MenuItemsOptionView.swift
//  LittleLemonMenu
//
//  Created by Andres Gago Alonso on 15/09/25.
//

import SwiftUI

struct MenuItemsOptionView: View {
    @Environment(\.dismiss) private var dismiss

    let delegate: MenuOptionsDelegate?

    @State private var selectedCategories: Set<MenuCategory>
    @State private var sort: SortOption

    init(delegate: MenuOptionsDelegate?,
         initialSelected: Set<MenuCategory> = Set(MenuCategory.allCases),
         initialSort: SortOption = .popular) {
        self.delegate = delegate
        _selectedCategories = State(initialValue: initialSelected)
        _sort = State(initialValue: initialSort)
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("SELECTED CATEGORIES")) {
                    ForEach(MenuCategory.allCases) { cat in
                        Toggle(cat.rawStringForUI, isOn: binding(for: cat))
                    }
                }

                Section(header: Text("SORT BY")) {
                    Picker("", selection: $sort) {
                        ForEach(SortOption.allCases) { opt in
                            Text(opt.rawValue).tag(opt)
                        }
                    }
                    .pickerStyle(.inline)
                }
            }
            .navigationTitle("Filter")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        delegate?.didUpdateFilters(categories: selectedCategories, sort: sort)
                        dismiss()
                    }
                }
            }
        }
    }

    private func binding(for cat: MenuCategory) -> Binding<Bool> {
        Binding(
            get: { selectedCategories.contains(cat) },
            set: { on in
                if on { selectedCategories.insert(cat) }
                else  { selectedCategories.remove(cat) }
            }
        )
    }
}

private extension MenuCategory {
    var rawStringForUI: String {
        switch self {
            case .food: return "Food"
            case .drink: return "Drink"
            case .dessert: return "Dessert"
        }
    }
}

#Preview {
    MenuItemsOptionView(delegate: nil)
}
