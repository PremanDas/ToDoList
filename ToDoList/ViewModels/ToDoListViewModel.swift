//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Geri-Das, Preman on 18/11/2024.
//

import FirebaseFirestore
import Foundation

class ToDoListViewModel: ObservableObject {
    @Published var showingNewItemView: Bool = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete To Do List Items
    /// - Parameter id: item id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
