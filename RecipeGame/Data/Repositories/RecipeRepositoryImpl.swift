//
//  RecipeRepositoryImpl.swift
//  RecipeGame
//
//  Created by Anjar Harimurti on 14/02/25.
//

import Foundation

class RecipeRepositoryImpl: RecipeRepository {
    private let recipes = [
        Recipe(name: "Spaghetti Carbonara",
               ingredients: ["Pasta", "Egg"],
               description: "Classic Italian pasta with creamy egg sauce",
               rarity: .common),
        Recipe(name: "Cheesy Pasta",
               ingredients: ["Pasta", "Cheese"],
               description: "Simple and delicious comfort food",
               rarity: .common),
        Recipe(name: "Veggie Stir Fry",
               ingredients: ["Broccoli", "Carrot"],
               description: "Healthy vegetable mix",
               rarity: .common),
        Recipe(name: "Fried Chicken",
               ingredients: ["Rice", "Chicken"],
               description: "Crispy fried chicken served with rice",
               rarity: .common),
        Recipe(name: "Mushroom Chicken",
               ingredients: ["Chicken", "Mushroom"],
               description: "Creamy Italian rice dish",
               rarity: .rare),
        Recipe(name: "Beef Stroganoff",
               ingredients: ["Beef", "Mushroom"],
               description: "Rich and creamy beef dish",
               rarity: .epic),
        Recipe(name: "Dragon's Curry",
               ingredients: ["Chicken", "Potato"],
               description: "Spicy and legendary curry",
               rarity: .legendary),
        Recipe(name: "Cheesy Omelette",
               ingredients: ["Egg", "Cheese"],
               description: "Fluffy omelette filled with melted cheese",
               rarity: .common),
        Recipe(name: "Mushroom Risotto",
               ingredients: ["Rice", "Mushroom"],
               description: "Creamy rice dish with savory mushrooms",
               rarity: .rare),

        Recipe(name: "Loaded Potato",
               ingredients: ["Potato", "Cheese"],
               description: "Baked potato topped with melted cheese",
               rarity: .common),

        Recipe(name: "Beef Bowl",
               ingredients: ["Rice", "Beef"],
               description: "Tender beef served over steaming rice",
               rarity: .rare),

        Recipe(name: "Ultimate Steak",
               ingredients: ["Beef", "Potato"],
               description: "Premium steak with roasted potatoes",
               rarity: .epic),

        Recipe(name: "Golden Chicken",
               ingredients: ["Chicken", "Cheese"],
               description: "Chicken smothered in rich cheese sauce",
               rarity: .rare),

        Recipe(name: "Royal Feast",
               ingredients: ["Beef", "Egg"],
               description: "Luxurious steak topped with perfect egg",
               rarity: .epic),

        Recipe(name: "Garden Chicken",
               ingredients: ["Chicken", "Broccoli"],
               description: "Healthy chicken with steamed broccoli",
               rarity: .common),

        Recipe(name: "Beef Stir Fry",
               ingredients: ["Beef", "Carrot"],
               description: "Quick-fried beef with crunchy carrots",
               rarity: .rare)
    ]

    func getAvailableRecipes() -> [Recipe] {
        recipes
    }

    func checkRecipeCombination(ingredients: [String]) -> Recipe? {
        recipes.first { recipe in
            recipe.ingredients.sorted() == ingredients.sorted()
        }
    }
}
