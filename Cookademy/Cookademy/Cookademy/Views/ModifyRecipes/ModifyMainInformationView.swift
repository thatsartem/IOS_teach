//
//  ModifyMainInformationView.swift
//  Cookademy
//
//  Created by Артем Клюев on 30.01.2022.
//

import SwiftUI

struct ModifyMainInformationView: View {
    @Binding var mainInformation: MainInformation
    private let listBackgroundColor = AppColor.background
    private let listForeground = AppColor.foreground
    
    var body: some View {
      Form {
        TextField("Recipe Name", text: $mainInformation.name)
          .listRowBackground(listBackgroundColor)
        TextField("Author", text: $mainInformation.author)
          .listRowBackground(listBackgroundColor)
        Section(header: Text("Description")) {
          TextEditor(text: $mainInformation.description)
            .listRowBackground(listBackgroundColor)
        }
          HStack {
              Text("Category")
              Spacer()
        Picker("", selection: $mainInformation.category) {
          ForEach(MainInformation.Category.allCases,
                  id: \.self) { category in
            Text(category.rawValue)
          }
                }
        .listRowBackground(listBackgroundColor)
        .pickerStyle(MenuPickerStyle())
      }
      }
      .foregroundColor(listForeground)
    }
  }

struct ModifyMainInformationView_Previews: PreviewProvider {
    @State static var mainInfo = MainInformation(name: "", description: "", author: "", category: .breakfast)
    
    static var previews: some View {
        ModifyMainInformationView(mainInformation: $mainInfo)
    }
}
