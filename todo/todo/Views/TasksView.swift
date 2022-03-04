//
//  TaskView.swift
//  todo
//
//  Created by Артем Клюев on 24.02.2022.
//

import SwiftUI

struct TasksView: View {
    @EnvironmentObject var viewModel: TaskViewModel
    @State var task: Task
    var body: some View {
        HStack{
            Button(action: {
                viewModel.check(task: &task)
                if task.isDone {
                    viewModel.toLast(task: task) }
            }, label: {task.isDone ? Image(systemName: "checkmark.circle.fill") : Image(systemName: "checkmark.circle")})
            Text(task.task)
            Spacer()
            Button(action: {
                viewModel.delete(id: task.id)
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.red)
                    .fixedSize()
            })
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView(task: Task(task: "abc")).environmentObject(TaskViewModel())
    }
}
