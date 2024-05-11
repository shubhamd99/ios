//
//  ToDoListItem.swift
//  TodoList
//
//  Created by shubham.dhage on 11/05/24.
//

import Foundation

// Struct are value types
struct TodoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(
        _ state: Bool
    ) {
        isDone = state
    }
}
