//
//  TaskViewModel.swift
//  todo
//
//  Created by Артем Клюев on 24.02.2022.
//

import SwiftUI

class TaskViewModel: ObservableObject {
    
    @Published var tasks = Tasks()
    
    func delete(id: UUID){
        tasks.remove(id: id)
    }
    
    func add (task: Task){
        tasks.add(task: task)
    }
    
    func isEmpty() -> Bool {
        return tasks.tasks.isEmpty
    }
    
    func check(task: inout Task){
        task.check()
    }
    
    func toLast(task: Task){
        tasks.remove(id: task.id)
        tasks.tasks.insert(task, at: tasks.numberOfTasks)
    }
    
}

