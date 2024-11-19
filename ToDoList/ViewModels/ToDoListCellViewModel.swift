//
//  ToDoListCellViewModel.swift
//  ToDoList
//
//  Created by Geri-Das, Preman on 18/11/2024.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class ToDoListCellViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var tempItem = item
        tempItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(tempItem.id)
            .setData(tempItem.asDictionary())
    }
}
