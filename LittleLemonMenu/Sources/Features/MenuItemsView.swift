//
//  MenuItemsView.swift
//  LittleLemonMenu
//
//  Created by Andres Gago Alonso on 15/09/25.
//

import SwiftUI

struct MenuItemsView: View {
    @StateObject private var vm = MenuViewViewModel()
    @State private var showFilters = false

    private let columns = [
        GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {

                    section(title: "Food",    items: vm.foodItems)
                    section(title: "Drinks",  items: vm.drinkItems)
                    section(title: "Dessert", items: vm.dessertItems)
                }
                .padding()
            }
            .navigationTitle("Menu")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { showFilters = true } label: {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                    }
                }
            }
            .sheet(isPresented: $showFilters) {
                MenuItemsOptionView(
                    delegate: vm,
                    initialSelected: vm.selectedCategories,
                    initialSort: vm.sort
                )
            }
            .alert("Data error", isPresented: .init(
                get: { vm.errorMessage != nil },
                set: { if !$0 { vm.errorMessage = nil } }
            )) {
                Button("OK", role: .cancel) { vm.errorMessage = nil }
            } message: {
                Text(vm.errorMessage ?? "")
            }
        }
    }

    @ViewBuilder
    private func section(title: String, items: [MenuItem]) -> some View {
        Text(title).font(.title3).bold()
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(items) { item in
                NavigationLink(destination: MenuItemDetailsView(item: item)) {
                    VStack {
                        Rectangle().fill(Color.black)
                            .frame(height: 60)
                            .cornerRadius(6)
                        Text(item.title)
                            .font(.caption)
                            .lineLimit(1)
                    }
                    .padding(4)
                }
            }
        }
    }
}

#Preview {
    MenuItemsView()
}
