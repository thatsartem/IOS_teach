//
//  test.swift
//  Cookademy
//
//  Created by Артем Клюев on 15.02.2022.
//

import SwiftUI

struct View1: View {
    @State var isNavigationBarHidden: Bool = true
    var body: some View {
        NavigationView {
            ZStack {
                Color.red
                NavigationLink("View 2", destination: View2(isNavigationBarHidden: self.$isNavigationBarHidden))
            }
            .navigationBarTitle("Hidden Title")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }
        }
    }
}

struct View2: View {
    @Binding var isNavigationBarHidden: Bool
    @State var isPresenting = false

    var body: some View {
        ZStack {
            List{
            Color.green
            NavigationLink("View 3", destination: View3())
            }
        }
        .toolbar(content: {
            ToolbarItem{
                Button(action: {isPresenting = true}, label: {
                    Image(systemName: "plus")
                })
            }
        })
        .sheet(isPresented: $isPresenting, content: {
            NavigationView{
                Text("Add")
                    .navigationTitle("Add a New Recipe")
                    .toolbar(content: {
                        ToolbarItem(placement: .navigationBarLeading){
                                Button("Dismiss"){
                                    isPresenting = false
                                }
                        }
                        ToolbarItem(placement: .confirmationAction){
                            
                                Button("Add"){
                                    isPresenting = false
                                }
                        }
                    })
            }
        })
        .navigationBarTitle("Visible Title 1")
        .onAppear {
            self.isNavigationBarHidden = false
        }
    }
}

struct View3: View {
    var body: some View {
        Color.blue
            .navigationBarTitle("Visible Title 2")
    }
}


struct test_Previews: PreviewProvider {
    static var previews: some View {
        View1()
    }
}
