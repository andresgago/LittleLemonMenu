//
//  MenuDataError.swift
//  LittleLemonMenu
//
//  Created by Andres Gago Alonso on 15/09/25.
//

import Foundation

enum MenuDataError: LocalizedError {
    case wrongCount(category: String, expected: Int, got: Int)

    var errorDescription: String? {
        switch self {
        case let .wrongCount(category, expected, got):
            return "Invalid mock data for \(category): expected \(expected), got \(got)."
        }
    }
}
