//
//  CheckRecipeUseCase.swift
//  RecipeGame
//
//  Created by Anjar Harimurti on 14/02/25.
//

import Foundation

protocol CheckRecipeUseCase {
    func execute(ingredients: [String]) -> Recipe?
}

struct CheckRecipeUseCaseImpl: CheckRecipeUseCase {
    private let repository: RecipeRepository

    init(repository: RecipeRepository) {
        self.repository = repository
    }

    func execute(ingredients: [String]) -> Recipe? {
        repository.checkRecipeCombination(ingredients: ingredients)
    }
}
