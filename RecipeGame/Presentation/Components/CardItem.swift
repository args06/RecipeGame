//
//  CardItem.swift
//  RecipeGame
//
//  Created by Anjar Harimurti on 14/02/25.
//

import SwiftUI

struct CardItem: View {
    let imageName: String
    let cardName: String

    var body: some View {
        VStack(spacing: 24) {

            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 28)

            Text(cardName)
                .font(.title2)

        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(uiColor: .systemBackground))
                .shadow(radius: 10)
        )
    }
}

#Preview {
    CardItem(
        imageName: "fork.knife",
        cardName: "My Recipes"
    )
}
