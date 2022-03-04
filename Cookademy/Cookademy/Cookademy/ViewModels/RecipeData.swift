//
//  RecipeData.swift
//  Cookademy
//
//  Created by Артем Клюев on 15.01.2022.
//

import Foundation

class RecipeData: ObservableObject{
    @Published var recipes = Recipe.testRecipes
    
    func recipes(for category: MainInformation.Category) -> [Recipe]{
        var filteredRecipies: [Recipe] = []
        for recipe in recipes {
            if recipe.mainInformation.category == category {
                filteredRecipies.append(recipe)
            }
        }
        return filteredRecipies
    }
    
    func add(_ newRecipe: Recipe){
        if newRecipe.isValid {recipes.append(newRecipe)}
    }

}
