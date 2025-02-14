//
//  DrawCardsOverlay.swift
//  RecipeGame
//
//  Created by Anjar Harimurti on 14/02/25.
//

import Foundation
import SwiftUI

struct DrawCardsOverlay: View {
    @EnvironmentObject private var viewModel: GameViewModel
    @State private var showCards = false

    var body: some View {
        VStack(spacing: 20) {
            Text("New Cards")
                .font(.title)
                .foregroundColor(.white)

            LazyVGrid(
                columns: [
                    GridItem(.adaptive(minimum: 120))
                ],
                spacing: 15
            ) {
                ForEach(viewModel.state.newCards) { card in
                    CardView(card: card,
                           rotation: card.isRevealed ? 360 : 0,
                           action: {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            viewModel.revealCard(card.id)
                        }
                    })
                    .offset(y: showCards ? 0 : 1000)
                    .animation(
                        .spring(response: 0.6, dampingFraction: 0.8)
                        .delay(Double(viewModel.state.newCards.firstIndex(where: { $0.id == card.id }) ?? 0) * 0.1),
                        value: showCards
                    )
                }
            }
            .padding()

            Button(action: {
                withAnimation {
                    viewModel.addCardsToLibrary()
                }
            }) {
                Text("Add to Library")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                    )
            }
            .disabled(!viewModel.state.newCards.allSatisfy(\.isRevealed))
            .opacity(viewModel.state.newCards.allSatisfy(\.isRevealed) ? 1 : 0.5)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(30)
        .background {
            Color.black.opacity(0.8)
                .ignoresSafeArea()
        }
        .onAppear {
            showCards = true
        }
    }
}

#Preview {
    let gameViewModel =  GameViewModel()
    VStack {
        DrawCardsOverlay()
        Button {
            gameViewModel.drawCards()
        } label: {
            Text("Text")
        }

    }
    .environmentObject(gameViewModel)
}
