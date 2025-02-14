//
//  CardLibraryView.swift
//  RecipeGame
//
//  Created by Anjar Harimurti on 14/02/25.
//

import Foundation
import SwiftUI

struct CardLibraryView: View {
    @EnvironmentObject private var router: NavigationManager
    @ObservedObject var viewModel: GameViewModel

    var body: some View {
        ZStack {
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
                            Image(systemName: "books.vertical.fill")
                                .font(.title2)
                            Text("Card Library")
                                .font(.title2.bold())
                        }
                    }
                    .frame(maxWidth: .infinity ,alignment: .center)
                }
                .padding(.bottom)

                VStack {
                    if !viewModel.state.cardLibrary.isEmpty {
                        ScrollView {
                            LazyVGrid(
                                columns: [
                                    GridItem(.adaptive(minimum: 100))
                                ],
                                spacing: 15
                            ) {
                                ForEach(viewModel.state.cardLibrary) { card in
                                    CardView(
                                        card: Card(
                                            name: card.name,
                                            isRevealed: true,
                                            color: card.color,
                                            symbol: card.symbol
                                        ),
                                        rotation: 0,
                                        action: {}
                                    )
                                }
                            }
                        }
                    }

                    Button {
                        withAnimation {
                            viewModel.showCombineView()
                        }
                    } label: {
                        HStack {
                            Image(systemName: "wand.and.stars")
                            Text("Create Recipe")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(LinearGradient(colors: [.purple, .blue],
                                                   startPoint: .leading,
                                                   endPoint: .trailing))
                        )
                        .shadow(radius: 5)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }

            if viewModel.state.showCombineView {
                CombineCardsView()
            }

            if viewModel.state.showCombineResult {
                CombineResultView()
            }
        }
        .environmentObject(viewModel)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(uiColor: .systemBackground))
                .shadow(radius: 10)
        )
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    let gameViewModel =  GameViewModel()
    VStack {
        CardLibraryView(viewModel: gameViewModel)
        Button {
            gameViewModel.drawCards()
            gameViewModel.addCardsToLibrary()
        } label: {
            Text("Text")
        }

    }
}
