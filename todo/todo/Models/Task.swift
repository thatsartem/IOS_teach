//
//  Task.swift
//  todo
//
//  Created by Артем Клюев on 24.02.2022.
//

import Foundation

struct Task: Identifiable{
    let id = UUID()
    let task: String
    var isDone: Bool = false
    static var tasks: [Task] = [
        Task(task: "gogogo"),
        Task(task: "lesgo")
    ]
    
    mutating func check(){
        isDone.toggle()
    }
}
