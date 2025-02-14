//
//  CardRepository.swift
//  RecipeGame
//
//  Created by Anjar Harimurti on 14/02/25.
//

import Foundation
import SwiftUI

protocol CardRepository {
    func getAvailableIngredients() -> [(name: String, color: Color, symbol: String)]
    func drawCards(count: Int) -> [Card]
}
