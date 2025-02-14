//
//  MyButton.swift
//  RecipeGame
//
//  Created by Anjar Harimurti on 14/02/25.
//

import SwiftUI

struct MyButton: View {

    let imageName: String
    let buttonText: String
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Image(systemName: imageName)
                
                if !buttonText.isEmpty {
                    Text(buttonText)
                }
            }
            .font(.subheadline)
            .foregroundColor(.white)
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(
                        LinearGradient(
                            colors: [.purple, .blue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            )
        }
    }
}

#Preview {
    MyButton(
        imageName: "fork.knife",
        buttonText: "My Recipes"
    ) {
        print("Clicked")
    }
}
