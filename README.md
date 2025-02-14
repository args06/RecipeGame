# Recipe Creation Card Game

A SwiftUI card game where players collect ingredients and discover recipes through combinations.

## Features

### Core Gameplay
- Draw ingredient cards to collect in your library
- Combine ingredients to discover new recipes
- Different recipe rarities: Common, Rare, Epic, and Legendary
- Animated card interactions and recipe discoveries with Lottie

### Ingredients
The game features various cooking ingredients, each with unique visuals:
- :spaghetti: Pasta
- :cheese: Cheese
- :broccoli: Broccoli
- :carrot: Carrot
- :rice: Rice
- :poultry_leg: Chicken
- :egg: Egg
- :potato: Potato
- :cut_of_meat: Beef
- :mushroom: Mushroom

### Recipes
Players can discover various recipes by combining ingredients. Some examples include:
- Common
  - Spaghetti Carbonara (Pasta + Egg)
  - Cheesy Pasta (Pasta + Cheese)
  - Veggie Stir Fry (Broccoli + Carrot)
  - Fried Chicken (Rice + Chicken)
- Rare
  - Mushroom Chicken (Chicken + Mushroom)
  - Golden Chicken (Chicken + Cheese)
  - Beef Bowl (Rice + Beef)
- Epic
  - Beef Stroganoff (Beef + Mushroom)
  - Ultimate Steak (Beef + Potato)
  - Royal Feast (Beef + Egg)
- Legendary
  - Dragon's Curry (Chicken + Potato)

## Technical Implementation

### Architecture
The project follows MVVM Clean Architecture pattern:
```
RecipeGame/
├── Core/            # Core configuration
├── Domain/          # Handle business logic
├── Data/            # Data handling
└── Presentation/    # ViewModels
└── UI/              # SwiftUI Views
```

## Development Setup

### Requirements
- Xcode 14.0+
- iOS 16.0+
- Swift 5.7+

### Installation
1. Clone the repository
2. Open `RecipeGame.xcodeproj` in Xcode
3. Build and run on simulator or device

### Test Flight
You can test the app from this Test Flight link : [Recipe Game](https://github.com/args06)

## Design Patterns & Best Practices
- MVVM Architecture
- Dependency Injection
- Clean Architecture principles
- SwiftUI best practices
- Reactive state management

## Credits
Developed as a demonstration of SwiftUI capabilities and clean architecture principles. This project is developed by [Anjar Harimurti](https://github.com/args06).

## Contact
You can reach out to me directly at [E-mail](mailto:<anjarharimurti.dev@gmail.com>).

<div align="center">

### Show some support by starring :star2: the repository! Thanks fo visitting.

</div>

