//
//  Recipe.swift
//  RecipeGame
//
//  Created by Anjar Harimurti on 14/02/25.
//

import Foundation

struct Recipe: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let ingredients: [String]
    let description: String
    let rarity: RecipeRarity
}
