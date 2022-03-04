//
//  WelcomeView.swift
//  Code History
//
//  Created by Артем Клюев on 07.01.2022.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView{
            ZStack{
                GameColor.main.ignoresSafeArea()
                VStack{
                    Spacer()
                    VStack(alignment: .center, spacing: 0) {
                        Text("Select the correct answers to the following questions.")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                                        }
                    
                    Spacer()
                    Spacer()
                    NavigationLink(destination: GameView(), label: {BottomTextView(str: "Okay, let's go!")}
                        )
                }
                .foregroundColor(.white)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
