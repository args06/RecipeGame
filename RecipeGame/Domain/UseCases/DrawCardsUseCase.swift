//
//  DrawCardsUseCase.swift
//  RecipeGame
//
//  Created by Anjar Harimurti on 14/02/25.
//

import Foundation

protocol DrawCardsUseCase {
    func execute(count: Int) -> [Card]
}

struct DrawCardsUseCaseImpl: DrawCardsUseCase {
    private let repository: CardRepository

    init(repository: CardRepository) {
        self.repository = repository
    }

    func execute(count: Int) -> [Card] {
        repository.drawCards(count: count)
    }
}
