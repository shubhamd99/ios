//
//  TodoListViewViewModel.swift
//  TodoList
//
//  Created by shubham.dhage on 11/05/24.
//

import FirebaseFirestore
import Foundation

class TodoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete
    /// - Parameter id: Item Id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
