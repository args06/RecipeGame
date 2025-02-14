//
//  CombineResultView.swift
//  RecipeGame
//
//  Created by Anjar Harimurti on 14/02/25.
//

import Foundation
import SwiftUI

struct CombineResultView: View {
    @EnvironmentObject private var viewModel: GameViewModel
    @State private var showDetails = false
    @State private var showAnimation = true

    var body: some View {
        VStack(spacing: 20) {
            if showAnimation {
                LottieView(
                    animation: .cardFlip,
                    loopMode: .playOnce
                ) {
                    showAnimation = false
                    showDetails = true
                }
                .frame(width: 200, height: 200, alignment: .center)
            }

            if showDetails {
                if viewModel.state.combineResultSuccess,
                   let lastRecipe = viewModel.state.recipes.last {
                    VStack(spacing: 10) {
                        Text(lastRecipe.name)
                            .font(.title2)
                            .foregroundColor(lastRecipe.rarity.color)

                        Text(lastRecipe.description)
                            .font(.body)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)

                        HStack {
                            ForEach(lastRecipe.ingredients, id: \.self) { ingredient in
                                Text(ingredient)
                                    .padding(8)
                                    .background(Color.white.opacity(0.2))
                                    .cornerRadius(8)
                            }
                        }

                        LottieView(animation: .recipeSuccess, loopMode: .loop)
                            .frame(width: 50, height: 50)

                        Text(lastRecipe.rarity.rawValue)
                            .font(.caption)
                            .padding(5)
                            .background(lastRecipe.rarity.color.opacity(0.2))
                            .foregroundColor(lastRecipe.rarity.color)
                            .cornerRadius(5)
                    }
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(15)
                    .transition(.opacity)
                } else {
                    LottieView(
                        animation: .recipeFail,
                        loopMode: .loop
                    ) {
                        showAnimation = false
                        showDetails = true
                    }
                    .frame(width: 50, height: 50)

                    Text("Combination Failed")
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .transition(.opacity)
                }

                Button(action: {
                    withAnimation(.spring()) {
                        viewModel.hideCombineResult()
                    }
                }) {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue)
                        )
                }
                .transition(.opacity)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(30)
        .background(Color.black.opacity(0.8))
        .cornerRadius(20)
        .padding()
        .background {
            Color.black.opacity(0.7)
                .ignoresSafeArea()
        }
    }
}

