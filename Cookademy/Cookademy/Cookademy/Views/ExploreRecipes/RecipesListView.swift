//
//  ContentView.swift
//  Cookademy
//
//  Created by Артем Клюев on 14.01.2022.
//

import SwiftUI

struct RecipesListView: View {
    @EnvironmentObject var recipeData: RecipeData
    let category: MainInformation.Category
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    @State private var isPresenting = false
    @State private var newRecipe = Recipe()

  var body: some View {
          HStack {
              List{
              ForEach(recipes) {recipe in
                  NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: recipe))
              }
                .listRowBackground(listBackgroundColor)
                .foregroundColor(listTextColor)
        }
        .navigationTitle(navigationTitle)
          .toolbar(content: {
              ToolbarItem{
                  Button(action: {isPresenting = true}, label: {
                      Image(systemName: "plus")
                  })
              }
          })
          .sheet(isPresented: $isPresenting, content: {
              NavigationView{
                  ModifyRecipeView(recipe: $newRecipe)
                      .navigationTitle("Add a New Recipe")
                      .toolbar(content: {
                          ToolbarItem(placement: .navigationBarLeading){
                                  Button("Dismiss"){
                                      isPresenting = false
                                  }
                          }
                          ToolbarItem(placement: .confirmationAction){
                              if newRecipe.isValid{
                                  Button("Add"){
                                      recipeData.add(newRecipe)
                                      isPresenting = false
                                  }
                              }
                          }
                      })
              }
      })

          
    }
  }
}

extension RecipesListView{
    
    private var recipes: [Recipe] {
        recipeData.recipes(for: category)
    }
    
    var navigationTitle: String {
        "\(category.rawValue) Recipes"
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipesListView(category: .breakfast)
                .environmentObject(RecipeData())
        }
    }
}


