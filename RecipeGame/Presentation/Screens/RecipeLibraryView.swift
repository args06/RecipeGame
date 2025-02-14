//
//  RecipeLibraryView.swift
//  RecipeGame
//
//  Created by Anjar Harimurti on 14/02/25.
//

import Foundation
import SwiftUI

struct RecipeLibraryView: View {
    @EnvironmentObject private var router: NavigationManager
    @ObservedObject var viewModel: GameViewModel

    var body: some View {
        VStack {
            ZStack {
                MyButton(
                    imageName: "arrow.left",
                    buttonText: ""
                ) {
                    router.goBack()
                }
                .frame(maxWidth: .infinity ,alignment: .leading)

                HStack {
                    HStack {
                        Image(systemName: "book.closed.fill")
                            .font(.title2)
                        Text("Recipe Book")
                            .font(.title2.bold())
                    }
                }
                .frame(maxWidth: .infinity ,alignment: .center)
            }
            .padding(.bottom)
            
            if viewModel.state.recipes.isEmpty {
                VStack(spacing: 20) {
                    LottieView(animation: .noRecipe, loopMode: .loop)
                        .frame(width: 100, height: 100)
                    
                    Text("No recipes discovered yet!")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    Text("Combine ingredients to create new recipes")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                .frame(maxHeight: .infinity)
            } else {
                ScrollView {
                    LazyVGrid(
                        columns: [
                            GridItem(.adaptive(minimum: 175))
                        ],
                        spacing: 15
                    ) {
                        ForEach(viewModel.state.recipes) { recipe in
                            RecipeCard(
                                recipe: recipe
                            )
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(uiColor: .systemBackground))
                .shadow(radius: 10)
        )
        .navigationBarBackButtonHidden()
    }
}
