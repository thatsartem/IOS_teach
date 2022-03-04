//
//  ScoreView.swift
//  Code History
//
//  Created by Артем Клюев on 11.01.2022.
//

import SwiftUI

struct ScoreView: View {
    let viewModel: ScoreViewModel
    var body: some View {
        NavigationView{
        ZStack{
            GameColor.main.ignoresSafeArea()
            VStack{
                Spacer()
                VStack{
                    Text("Final Score:")
                        .font(.body)
                    Text("\(viewModel.percentage)%")
                        .font(.system(size: 50))
                        .bold()
                        .padding()
                }
                Spacer()
                VStack{
                    Text("\(viewModel.correctGuesses) ✅")
                    Text("\(viewModel.incorrectGuesses) ❌")
                }
                .font(.system(size: 30))
                Spacer()
                NavigationLink(destination: GameView(), label: {BottomTextView(str: "Re-take Quiz")})
                    .navigationBarHidden(true)
            }
        }
        .foregroundColor(.white)
    }.navigationBarHidden(true)

    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(viewModel: ScoreViewModel(correctGuesses: 8, incorrectGuesses: 2))
    }
}
