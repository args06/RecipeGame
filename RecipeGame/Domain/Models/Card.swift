//
//  Card.swift
//  RecipeGame
//
//  Created by Anjar Harimurti on 14/02/25.
//

import Foundation
import SwiftUI

struct Card: Identifiable, Equatable {
    let id = UUID()
    let name: String
    var isRevealed: Bool
    let color: Color
    let symbol: String
}
