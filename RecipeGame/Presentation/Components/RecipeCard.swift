//
//  RecipeCard.swift
//  RecipeGame
//
//  Created by Anjar Harimurti on 14/02/25.
//

import Foundation
import SwiftUI

struct RecipeCard: View {
    let recipe: Recipe

    var body: some View {
        VStack(spacing: 15) {
            Text(recipe.name)
                .font(.headline)
                .foregroundColor(recipe.rarity.color)
                .multilineTextAlignment(.center)

            Text(recipe.description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)

            HStack {
                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                        .font(.caption)
                        .padding(5)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                }
            }
        }
        .frame(width: 150, height: 200)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(
                    LinearGradient(
                        colors: [recipe.rarity.color.opacity(0.5), recipe.rarity.color.opacity(0.2)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .shadow(color: recipe.rarity.color.opacity(0.5),
                        radius: 5)
        )
    }
}

#Preview {
    RecipeCard(
        recipe: Recipe(
            name: "Spaghetti Carbonara",
            ingredients: ["Pasta", "Egg"],
            description: "Classic Italian pasta with creamy egg sauce",
            rarity: .common)
    )
}
