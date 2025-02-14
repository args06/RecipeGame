//
//  RecipeRepository.swift
//  RecipeGame
//
//  Created by Anjar Harimurti on 14/02/25.
//

import Foundation

protocol RecipeRepository {
    func getAvailableRecipes() -> [Recipe]
    func checkRecipeCombination(ingredients: [String]) -> Recipe?
}
