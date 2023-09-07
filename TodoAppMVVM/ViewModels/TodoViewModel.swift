//
//  TodoViewModel.swift
//  TodoAppMVVM
//
//  Created by Fuad Reza Pahlevi on 06/09/23.
//

import Foundation

class TodoViewModel: ObservableObject {
    @Published var items: [TodoModel] = [] {
        didSet {
            saveTodos()
        }
    }
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: TodoModel.keyList),
            let newTodos = try? JSONDecoder().decode([TodoModel].self, from: data)
        else { return }
        
        self.items = newTodos
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
    
    func saveTodos() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: TodoModel.keyList)
        }
    }
}
