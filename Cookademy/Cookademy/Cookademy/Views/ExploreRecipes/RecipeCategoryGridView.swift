//
//  RecipeCategoryGridView.swift
//  Cookademy
//
//  Created by Артем Клюев on 15.01.2022.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    let columns = [GridItem(),GridItem()]
    @StateObject var recipeData = RecipeData()
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns, content: {
                    ForEach(MainInformation.Category.allCases, id: \.self){category in
                        NavigationLink(destination: RecipesListView(category: category)
                                        .environmentObject(recipeData)
                                       , label: {
                            CategoryView(category: category)
                        })
                    }
                })
            }
            .navigationTitle("Categories")

        }
    }
}



struct CategoryView: View {
    let category: MainInformation.Category
    var body: some View{
        ZStack{
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.35)
            Text(category.rawValue)
                .font(.title)
        }
        .foregroundColor(.black)
    }
}

struct RecipeCategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryGridView()
    }
}
