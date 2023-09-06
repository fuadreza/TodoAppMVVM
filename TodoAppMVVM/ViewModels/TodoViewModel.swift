//
//  TodoViewModel.swift
//  TodoAppMVVM
//
//  Created by Fuad Reza Pahlevi on 06/09/23.
//

import Foundation

class TodoViewModel: ObservableObject {
    @Published var items: [TodoModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            TodoModel(todo: "First Task", isCompleted: false),
            TodoModel(todo: "Second Task", isCompleted: true),
            TodoModel(todo: "Third Task", isCompleted: false),
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(todo: String) {
        let newItem = TodoModel(todo: todo, isCompleted: false)
        
        items.append(newItem)
    }
    
    func toggleCompleted(todo: TodoModel) {
        if let index = items.firstIndex(where: { $0.id == todo.id }) {
            items[index] = todo.toggleCompleted()
        }
    }
}
