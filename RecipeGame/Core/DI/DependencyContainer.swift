//
//  DependencyContainer.swift
//  RecipeGame
//
//  Created by Anjar Harimurti on 14/02/25.
//

import Foundation

@propertyWrapper
struct Inject<T> {
    let wrappedValue: T

    init() {
        self.wrappedValue = DependencyContainer.shared.resolve()
    }
}

final class DependencyContainer {
    static let shared = DependencyContainer()
    private var dependencies: [String: Any] = [:]
    private var isRegistered = false

    func start() {
        guard !isRegistered else { return }
        registerDependencies()
        isRegistered = true
    }

    private func registerDependencies() {

        register(type: CardRepository.self) { () -> CardRepository in
            return CardRepositoryImpl()
        }

        register(type: RecipeRepository.self) { () -> RecipeRepository in
            return RecipeRepositoryImpl()
        }

        register(type: CheckRecipeUseCase.self) { [weak self] () -> CheckRecipeUseCase in
            guard let self = self else { fatalError("Self is nil") }
            return CheckRecipeUseCaseImpl(repository: self.resolve())
        }

        register(type: DrawCardsUseCase.self) { [weak self] () -> DrawCardsUseCase in
            guard let self = self else { fatalError("Self is nil") }
            return DrawCardsUseCaseImpl(repository: self.resolve())
        }

    }

    func register<T>(type: T.Type, component: @autoclosure @escaping () -> T) {
        dependencies[String(describing: type)] = component
    }

    func register<T>(type: T.Type, component: @escaping () -> T) {
        dependencies[String(describing: type)] = component
    }

    func resolve<T>() -> T {
        let key = String(describing: T.self)
        guard let component = dependencies[key] else {
            fatalError("No dependency found for \(key)")
        }

        if let component = component as? T {
            return component
        } else if let factory = component as? () -> T {
            return factory()
        }

        fatalError("Could not resolve dependency for \(key)")
    }
}
