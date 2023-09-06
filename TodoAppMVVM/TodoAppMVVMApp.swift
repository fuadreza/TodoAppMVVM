//
//  TodoAppMVVMApp.swift
//  TodoAppMVVM
//
//  Created by Fuad Reza Pahlevi on 05/09/23.
//

import SwiftUI

@main
struct TodoAppMVVMApp: App {
    
    @State var todoViewModel: TodoViewModel = TodoViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView()
            }
            .environmentObject(todoViewModel)
        }
    }
}
