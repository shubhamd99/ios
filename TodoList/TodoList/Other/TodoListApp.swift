//
//  TodoListApp.swift
//  TodoList
//
//  Created by shubham.dhage on 11/05/24.
//

import FirebaseCore
import SwiftUI

@main
struct TodoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
