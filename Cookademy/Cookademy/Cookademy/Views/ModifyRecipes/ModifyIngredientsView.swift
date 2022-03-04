//
//  ModifyIngredientsView.swift
//  Cookademy
//
//  Created by Артем Клюев on 15.02.2022.
//

import SwiftUI

struct ModifyIngredientsView: View {
    @Binding var ingredients: [Ingredient]
    @State var newIngredient = Ingredient()
    let listBackColor = AppColor.background
    let textColor = AppColor.foreground
    var body: some View {
        let addIngredientView = ModifyIngredientView(ingredient: $newIngredient){
            ingredient in
            ingredients.append(ingredient)
            newIngredient = Ingredient()
        }
        VStack{
        if ingredients.isEmpty {
            Spacer()
            NavigationLink("Add the first ingredient!", destination: addIngredientView)
            Spacer()
        } else {
            List{
                ForEach(ingredients.indices, id: \.self){index in
                    let ingredient = ingredients[index]
                    Text(ingredient.description)
                }
                .foregroundColor(textColor)

                NavigationLink("Add another ingredient", destination: addIngredientView)
                    .buttonStyle(PlainButtonStyle())
            }.foregroundColor(.blue)
            .listRowBackground(listBackColor)
        }
    }
    }
}

struct ModifyIngredientsView_Previews:
    PreviewProvider {
    @State static var ingredients: [Ingredient] = []
    static var previews: some View {
        ModifyIngredientsView(ingredients: $ingredients)
    }
}
