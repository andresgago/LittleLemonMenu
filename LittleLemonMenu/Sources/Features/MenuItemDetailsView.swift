//
//  MenuItemDetailsView.swift
//  LittleLemonMenu
//
//  Created by Andres Gago Alonso on 15/09/25.
//

import SwiftUI

struct MenuItemDetailsView: View {
    let item: MenuItem

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image("littleLemon")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 260)

                Text(item.title)
                    .font(.largeTitle).bold()

                VStack(alignment: .leading, spacing: 8) {
                    Text("Price: \(String(format: "%.2f", item.price))")
                    Text("Ordered: \(item.ordered)")
                    Text("Ingredients:")
                        .font(.headline)
                    ForEach(item.ingredients, id: \.self) { ing in
                        Text(ing.rawValue)
                    }
                }
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Menu")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MenuItemDetailsView(item: MockMenuData.all.first!)
}
