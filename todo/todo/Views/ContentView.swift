//
//  ContentView.swift
//  todo
//
//  Created by Артем Клюев on 24.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var task: String = ""
    
    @StateObject var viewModel = TaskViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                Section {
                        HStack{
                            TextField("Write new task here!", text: $task)
                                .padding()
                            Button(action: {
                                if !task.isEmpty {
                                viewModel.add(task: Task(task: task))
                                    task = ""
                                }
                                
                            }, label: {Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.green)
                                    .padding()
                                    
                            })
                        }
                        .border(.black,width: 1)
                        .cornerRadius(10)
                    if !viewModel.isEmpty() {
                    Section(header: Text("Tasks")){
                        ForEach(viewModel.tasks.tasks){ task in
                            TasksView(task: task)
                                .padding()
                        }
                    }
                        .environmentObject(viewModel)
                    }
                }
                .navigationTitle("ToDo List")
                Spacer()

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
