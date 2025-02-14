//
//  CombineCardsView.swift
//  RecipeGame
//
//  Created by Anjar Harimurti on 14/02/25.
//

import Foundation
import SwiftUI

struct CombineCardsView: View {
    @EnvironmentObject private var viewModel: GameViewModel

    var body: some View {
        HStack(spacing: 20) {
            VStack {
                Text("Select Ingredients")
                    .font(.title2.bold())
                    .foregroundColor(.white)

                ScrollView {
                    LazyVGrid(
                        columns: [
                            GridItem(.adaptive(minimum: 100))
                        ],
                        spacing: 15
                    ) {
                        ForEach(viewModel.state.cardLibrary) { card in
                            CardView(card: card,
                                   rotation: 0,
                                   action: {
                                viewModel.selectCard(card)
                            })
                            .overlay(
                                viewModel.state.selectedCards.contains(where: { $0.id == card.id }) ?
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.yellow, lineWidth: 3)
                                    .shadow(color: .yellow, radius: 5) : nil
                            )
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white.opacity(0.1))
            .cornerRadius(20)

            VStack(spacing: 20) {
                HStack(spacing: 20) {
                    ForEach(0..<2) { index in
                        if index < viewModel.state.selectedCards.count {
                            CardView(card: viewModel.state.selectedCards[index],
                                   rotation: 0,
                                   action: {
                                viewModel.selectCard(viewModel.state.selectedCards[index])
                            })
                        } else {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white.opacity(0.2))
                                .frame(width: 80, height: 120)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .strokeBorder(.white.opacity(0.3), lineWidth: 2)
                                )
                        }
                    }
                }

                VStack(spacing: 15) {
                    Button(action: {
                        viewModel.checkCombination()
                    }) {
                        HStack {
                            Image(systemName: "wand.and.stars.inverse")
                            Text("Combine")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(
                                    LinearGradient(colors: [.purple, .blue],
                                                 startPoint: .leading,
                                                 endPoint: .trailing)
                                )
                        )
                        .shadow(radius: 5)
                    }
                    .disabled(viewModel.state.selectedCards.count != 2)
                    .opacity(viewModel.state.selectedCards.count == 2 ? 1 : 0.5)

                    Button(action: {
                        withAnimation {
                            viewModel.hideCombineView()
                        }
                    }) {
                        Text("Close")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.red.opacity(0.8))
                            )
                    }
                }
            }
            .frame(width: 200)
            .padding()
            .background(Color.white.opacity(0.1))
            .cornerRadius(20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(20)
        .background {
            Color.black.opacity(0.8)
                .ignoresSafeArea()
        }
        .alert(isPresented: $viewModel.state.showAlert) {
            Alert(
                title: Text("Notice"),
                message: Text(viewModel.state.alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    let gameViewModel =  GameViewModel()
    VStack {
        CombineCardsView()
        Button {
            gameViewModel.drawCards()
            gameViewModel.addCardsToLibrary()
        } label: {
            Text("Text")
        }

    }
    .environmentObject(gameViewModel)
}
