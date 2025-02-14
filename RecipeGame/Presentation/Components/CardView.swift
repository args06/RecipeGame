//
//  CardView.swift
//  RecipeGame
//
//  Created by Anjar Harimurti on 14/02/25.
//

import Foundation
import SwiftUI

struct CardView: View {
    let card: Card
    var rotation: Double
    let action: () -> Void

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(
                    LinearGradient(
                        colors: [card.color.opacity(0.7), card.color.opacity(0.3)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(card.color.opacity(0.5), lineWidth: 2)
                )
                .shadow(color: card.color.opacity(0.3), radius: 5, x: 0, y: 2)

            if card.isRevealed {
                VStack {
                    Text(card.symbol)
                        .font(.system(size: 30))
                    Text(card.name)
                        .font(.caption)
                        .foregroundColor(.primary)
                }
            } else {
                VStack {
                    Text("❓")
                        .font(.system(size: 30))
                    Text("Mystery")
                        .font(.caption)
                        .foregroundColor(.primary)
                }
            }
        }
        .frame(width: 80, height: 120)
        .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
        .onTapGesture(perform: action)
    }
}
