//
//  ContentView.swift
//  RecipeGame
//
//  Created by Anjar Harimurti on 14/02/25.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject private var router: NavigationManager
    @StateObject private var viewModel = GameViewModel()

    var body: some View {
        ZStack {

            VStack {
                HStack {
                    Text("Recipe Creation")
                        .font(.largeTitle.bold())

                    Spacer()

                    MyButton(
                        imageName: "rectangle.stack.fill",
                        buttonText: "Draw Cards"
                    ) {
                        viewModel.drawCards()
                    }

                }
                .padding([.top])

                HStack(spacing: 20) {

                    CardItem(
                        imageName: "takeoutbag.and.cup.and.straw.fill",
                        cardName: "My Ingredients"
                    )
                    .onTapGesture {
                        router.navigate(to: .ingredient(viewModel))
                    }

                    CardItem(
                        imageName: "fork.knife",
                        cardName: "My Recipes"
                    )
                    .onTapGesture {
                        router.navigate(to: .recipe(viewModel))
                    }

                }
                .padding()
            }
            .background {
                LinearGradient(colors: [.purple.opacity(0.2), .blue.opacity(0.2)],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
            }

            if viewModel.state.showDrawOverlay {
                DrawCardsOverlay()
                    .environmentObject(viewModel)
            }
        }

    }
}

#Preview {
    DashboardView()
        .environmentObject(NavigationManager())
}
