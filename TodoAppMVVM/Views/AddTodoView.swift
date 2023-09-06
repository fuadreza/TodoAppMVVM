//
//  NewTodoView.swift
//  TodoAppMVVM
//
//  Created by Fuad Reza Pahlevi on 05/09/23.
//

import SwiftUI

struct AddTodoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var todoViewModel: TodoViewModel
    @State var textFieldNewTodo: String = ""
    
    @State var isAlertShowing: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField(
                    "Type new activity",
                    text: $textFieldNewTodo,
                    axis: .vertical
                )
                .background(Color.red)
                .cornerRadius(10)
                .font(Font.system(size: 20, design: .rounded))
                .lineLimit(5...7)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(
                    action: saveButtonPressed,
                    label: {
                        Text("Save".uppercased())
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    }
                )
            }
            .padding(14)
        }
        .navigationTitle("Add To Do")
        .alert("New Activity length should be more than 3 characters", isPresented: $isAlertShowing) {
            Button("OK", role: .cancel) {
                isAlertShowing = false
            }
        }
    }
    
    func saveButtonPressed() {
        if (isTextFieldValid()) {
            todoViewModel.addItem(todo: textFieldNewTodo)
            presentationMode.wrappedValue.dismiss()
        } else {
            isAlertShowing = true
        }
    }
    
    func isTextFieldValid() -> Bool {
        return textFieldNewTodo.count > 3
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddTodoView()
        }
        .environmentObject(TodoViewModel())
    }
}
