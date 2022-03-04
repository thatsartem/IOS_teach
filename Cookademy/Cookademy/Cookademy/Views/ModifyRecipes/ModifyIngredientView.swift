//
//  ModifyIngredientView.swift
//  Cookademy
//
//  Created by Артем Клюев on 31.01.2022.
//

import SwiftUI

struct ModifyIngredientView: View {
    @Binding var ingredient: Ingredient
    private let textColor = AppColor.foreground
    private let backGround = AppColor.background
    let createAction: ((Ingredient) -> Void)
    @Environment(\.presentationMode) private var mode
    var body: some View {
        Form{
            TextField("Ingredient name", text: $ingredient.name)
                .listRowBackground(backGround)
            Stepper( value: $ingredient.quantity, in: 0...100, step: 0.5){
                HStack{
                    Text("Quantity")
                    TextField("Quantity", value: $ingredient.quantity, formatter: NumberFormatter.decimal)
                        .keyboardType(.numbersAndPunctuation)
                }
            }.listRowBackground(backGround)
            
            HStack {
                Text("Unit")
                Spacer()
                Picker("", selection: $ingredient.unit){
                    ForEach(Ingredient.Unit.allCases, id: \.self){ unit in
                        Text(unit.rawValue)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }.listRowBackground(backGround)
            HStack{
                Spacer()
                Button("Save") {
                    createAction(ingredient)
                    mode.wrappedValue.dismiss()
                }
                Spacer()
            }.listRowBackground(backGround)
            
        }
        .foregroundColor(textColor)
    }
}

extension NumberFormatter {
  static var decimal: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    return formatter
  }
}

struct ModifyIngredientView_Previews: PreviewProvider
{
    @State static var emptyIngredient = Ingredient()
    static var previews: some View {
        ModifyIngredientView(ingredient: $emptyIngredient){ingredient in }
    }
}
