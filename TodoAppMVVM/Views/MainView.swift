//
//  MainView.swift
//  TodoAppMVVM
//
//  Created by Fuad Reza Pahlevi on 05/09/23.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var todoViewModel: TodoViewModel
    
    var body: some View {
        List {
            ForEach(todoViewModel.items) { item in
                ListTodoView(todo: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            todoViewModel.toggleCompleted(todo: item)
                        }
                    }
            }
            .onDelete(perform: todoViewModel.deleteItem)
            .onMove(perform: todoViewModel.moveItem)
        }
        .navigationTitle("Todo App")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddTodoView())
        )
    }
    
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                MainView()
            }
            .environmentObject(TodoViewModel())
        }
    }
}
