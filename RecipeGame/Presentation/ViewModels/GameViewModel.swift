//
//  GameViewModel.swift
//  RecipeGame
//
//  Created by Anjar Harimurti on 14/02/25.
//

import Foundation

@MainActor
class GameViewModel: ObservableObject {
    @Published var state = GameState()
    
    @Inject private var drawCardsUseCase: DrawCardsUseCase
    @Inject private var checkRecipeUseCase: CheckRecipeUseCase

    func drawCards() {
        state.newCards = drawCardsUseCase.execute(count: 5)
        state.showDrawOverlay = true
    }
    
    func addCardsToLibrary() {
        state.cardLibrary.append(contentsOf: state.newCards.map { 
            Card(name: $0.name, isRevealed: true, color: $0.color, symbol: $0.symbol) 
        })
        state.showDrawOverlay = false
        state.newCards.removeAll()
    }
    
    func selectCard(_ card: Card) {
        if state.selectedCards.contains(where: { $0.id == card.id }) {
            state.selectedCards.removeAll { $0.id == card.id }
        } else {
            if state.selectedCards.count >= 2 {
                state.showAlert = true
                state.alertMessage = "You can only select 2 cards"
                return
            }
            state.selectedCards.append(card)
        }
    }
    
    func revealCard(_ cardId: UUID) {
        if let index = state.newCards.firstIndex(where: { $0.id == cardId }) {
            state.newCards[index].isRevealed = true
        }
    }
    
    func checkCombination() {
        guard state.selectedCards.count == 2 else {
            state.showAlert = true
            state.alertMessage = "Please select 2 cards"
            return
        }
        
        let ingredients = state.selectedCards.map { $0.name }
        if let recipe = checkRecipeUseCase.execute(ingredients: ingredients) {

            if state.recipes.contains(where: { $0.name == recipe.name }) {
                state.showAlert = true
                state.alertMessage = "You already discovered this recipe!"
                return
            }
            
            state.recipes.append(recipe)
            state.combineResultSuccess = true
            
            for card in state.selectedCards {
                state.cardLibrary.removeAll { $0.id == card.id }
            }
        } else {
            state.combineResultSuccess = false
        }
        
        state.showCombineResult = true
    }
    
    func showCombineView() {
        state.showCombineView = true
    }
    
    func hideCombineView() {
        state.showCombineView = false
        state.selectedCards.removeAll()
    }
    
    func hideCombineResult() {
        state.showCombineResult = false
        state.showCombineView = false
        state.selectedCards.removeAll()
    }
}
