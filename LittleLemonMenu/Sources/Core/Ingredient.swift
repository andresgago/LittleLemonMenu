//
//  Ingredient.swift
//  LittleLemonMenu
//
//  Created by Andres Gago Alonso on 15/09/25.
//

import Foundation

enum Ingredient: String, CaseIterable, Identifiable {
    case spinach      = "Spinach"
    case broccoli     = "Broccoli"
    case carrot       = "Carrot"
    case pasta        = "Pasta"
    case tomatoSauce  = "Tomato sauce"

    var id: Self { self }
}
