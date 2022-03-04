//
//  Tasks.swift
//  todo
//
//  Created by Артем Клюев on 24.02.2022.
//

import Foundation


struct Tasks{
    var tasks = Task.tasks
    
    mutating func add(task: Task){
        tasks.insert(task, at: 0)
    }
    
    var numberOfTasks: Int {
        tasks.count
    }
    
    mutating func remove(id: UUID) {
//        var removalTask: Task = Task(task: "")
//
//        for task in tasks {
//            if (task.id == id) {
//                removalTask = task
//                break
//            }
//        }
//
        tasks = tasks.filter({$0.id != id})
        
//        return removalTask
    }
        
}
