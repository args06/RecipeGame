//
//  CardRepositoryImpl.swift
//  RecipeGame
//
//  Created by Anjar Harimurti on 14/02/25.
//

import Foundation
import SwiftUI

class CardRepositoryImpl: CardRepository {
    private let ingredients = [
        ("Pasta", Color.yellow, "🍝"),
        ("Cheese", Color.orange, "🧀"),
        ("Broccoli", Color.green, "🥦"),
        ("Carrot", Color.orange, "🥕"),
        ("Rice", Color.white, "🍚"),
        ("Chicken", Color.brown, "🍗"),
        ("Egg", Color.yellow, "🥚"),
        ("Potato", Color.brown, "🥔"),
        ("Beef", Color.red, "🥩"),
        ("Mushroom", Color.brown, "🍄")
    ]
    
    func getAvailableIngredients() -> [(name: String, color: Color, symbol: String)] {
        ingredients
    }
    
    func drawCards(count: Int) -> [Card] {
        (0..<count).map { _ in
            let ingredient = ingredients.randomElement()!
            return Card(name: ingredient.0,
                       isRevealed: false,
                       color: ingredient.1,
                       symbol: ingredient.2)
        }
    }
}
