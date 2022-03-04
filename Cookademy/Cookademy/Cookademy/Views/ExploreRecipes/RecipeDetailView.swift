//
//  RecipeDetailView.swift
//  Cookademy
//
//  Created by Артем Клюев on 15.01.2022.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    private let ListBackgroundColor = AppColor.background
    private let ListTextColor = AppColor.foreground
    var body: some View {
        
        VStack{
            HStack{
                Text("Author: \(recipe.mainInformation.author)")
                    .padding()
                Spacer()
            }
            HStack{
                Text(recipe.mainInformation.description)
                    .padding()
                Spacer()
            }
            List{
                Section(header: Text("Ingredients")){
                    ForEach(recipe.ingredients.indices, id: \.self){index in
                        let ingredient = recipe.ingredients[index]
                        Text(ingredient.description)
                    }.foregroundColor(ListTextColor)
                }
                .listRowBackground(ListBackgroundColor)
                
                Section(header: Text("Directions")){
                    ForEach(recipe.directions.indices, id: \.self){index in
                        let direction = recipe.directions[index]
                        HStack{
                            Text("\(index+1). ").bold()
                            Text("\(direction.isOptional ? "(Optional)" : "")" + "\(direction.description)")
                        }
                    }.foregroundColor(ListTextColor)
                }
                .listRowBackground(ListBackgroundColor)
                
            }
        }
        .navigationTitle(recipe.mainInformation.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RecipeDetailView(recipe: Recipe.testRecipes[0])
        }
    }
}
