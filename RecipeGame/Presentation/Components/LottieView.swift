//
//  LottieView.swift
//  RecipeGame
//
//  Created by Anjar Harimurti on 14/02/25.
//

import Foundation
import SwiftUI
import Lottie

enum LottieAnimation: String {
    case cardFlip = "card-flip"
    case recipeSuccess = "recipe-success"
    case recipeFail = "recipe-fail"
    case noRecipe = "no-recipe"
}

struct LottieView: UIViewRepresentable {
    let animation: LottieAnimation
    var loopMode: LottieLoopMode = .playOnce
    var contentMode: UIView.ContentMode = .scaleAspectFit
    var completion: (() -> Void)?

    private let animationView: LottieAnimationView

    init(animation: LottieAnimation,
         loopMode: LottieLoopMode = .playOnce,
         contentMode: UIView.ContentMode = .scaleAspectFit,
         completion: (() -> Void)? = nil) {
        self.animation = animation
        self.loopMode = loopMode
        self.contentMode = contentMode
        self.completion = completion

        animationView = LottieAnimationView(name: animation.rawValue)
    }

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        view.addSubview(animationView)

        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.contentMode = contentMode
        animationView.loopMode = loopMode

        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        animationView.play { finished in
            if finished {
                completion?()
            }
        }
    }
}
