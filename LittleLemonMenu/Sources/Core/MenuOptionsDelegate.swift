//
//  MenuOptionsDelegate.swift
//  LittleLemonMenu
//
//  Created by Andres Gago Alonso on 15/09/25.
//

import Foundation

protocol MenuOptionsDelegate: AnyObject {
    func didUpdateFilters(categories: Set<MenuCategory>, sort: SortOption)
}
