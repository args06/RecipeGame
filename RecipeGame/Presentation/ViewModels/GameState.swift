//
//  GameState.swift
//  RecipeGame
//
//  Created by Anjar Harimurti on 14/02/25.
//

import Foundation

struct GameState {
    var cardLibrary: [Card] = []
    var recipes: [Recipe] = []
    var selectedCards: [Card] = []
    var newCards: [Card] = []
    var showDrawOverlay = false
    var showCombineView = false
    var showCombineResult = false
    var showAlert = false
    var alertMessage = ""
    var combineResultSuccess = false
}
