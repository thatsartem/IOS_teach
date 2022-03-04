//
//  ScoreViewModel.swift
//  Code History
//
//  Created by Артем Клюев on 11.01.2022.
//

import Foundation


struct ScoreViewModel{
    let correctGuesses: Int
    let incorrectGuesses: Int
    
    var percentage: Int {
        correctGuesses * 100/(correctGuesses + incorrectGuesses) 
    }
}
