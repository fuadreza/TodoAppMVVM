//
//  ListTodoView.swift
//  TodoAppMVVM
//
//  Created by Fuad Reza Pahlevi on 05/09/23.
//

import SwiftUI

struct ListTodoView: View {
    
    let todo: TodoModel
    
    var body: some View {
        HStack {
            Image(systemName: todo.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(todo.isCompleted ? Color.green: Color.gray)
            Text(todo.todo)
                .strikethrough(todo.isCompleted)
            Spacer()
        }
    }
}


struct ListTodoView_Previews: PreviewProvider {
    
    static var todo1: TodoModel = TodoModel(todo: "Preview todo", isCompleted: false)
    static var todo2: TodoModel = TodoModel(todo: "Preview todo Second", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListTodoView(todo: todo1)
            ListTodoView(todo: todo2)
        }
        .previewLayout(.sizeThatFits)
    }
}
