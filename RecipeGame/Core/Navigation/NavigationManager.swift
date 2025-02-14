//
//  NavigationManager.swift
//  RecipeGame
//
//  Created by Anjar Harimurti on 14/02/25.
//


import Foundation
import SwiftUI

class NavigationManager: ObservableObject {
    @Published var path = NavigationPath()

    func navigate(to destination: Destination) {
        path.append(destination)
    }

    func goBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }

    func goBackToRoot() {
        path.removeLast(path.count)
    }

    func clearStackAndNavigate(to destination: Destination) {
        DispatchQueue.main.async {
            self.path = NavigationPath()
            self.path.append(destination)
        }
    }
}

enum Destination: Hashable {
    case dashboard
    case ingredient(GameViewModel)
    case recipe(GameViewModel)

    func hash(into hasher: inout Hasher) {
        switch self {
        case .dashboard: hasher.combine(0)
        case .ingredient: hasher.combine(1)
        case .recipe: hasher.combine(2)
        }
    }

    static func == (lhs: Destination, rhs: Destination) -> Bool {
        switch (lhs, rhs) {
        case (.dashboard, .dashboard): return true
        case (.ingredient, .ingredient): return true
        case (.recipe, .recipe): return true
        default: return false
        }
    }
}
