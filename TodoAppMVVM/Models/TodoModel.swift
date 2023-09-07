//
//  TodoModel.swift
//  TodoAppMVVM
//
//  Created by Fuad Reza Pahlevi on 06/09/23.
//

import Foundation

// Immutable Struct

struct TodoModel: Identifiable, Codable {
    static var keyList: String = "todo_list"
    let id: String
    let todo: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, todo: String, isCompleted: Bool) {
        self.id = id
        self.todo = todo
        self.isCompleted = isCompleted
    }
    
    func toggleCompleted() -> TodoModel {
        return TodoModel(id:id, todo: todo, isCompleted: !isCompleted)
    }
}
