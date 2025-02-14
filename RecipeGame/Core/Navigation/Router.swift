//
//  Router.swift
//  RecipeGame
//
//  Created by Anjar Harimurti on 14/02/25.
//


import Foundation
import SwiftUI

class Router {
    @ViewBuilder
    func view(for destination: Destination) -> some View {
        switch destination {
        case .dashboard:
            DashboardView()
            
        case .ingredient(let viewModel):
            CardLibraryView(viewModel: viewModel)
            
        case .recipe(let viewModel):
            RecipeLibraryView(viewModel: viewModel)
        }
    }
}
