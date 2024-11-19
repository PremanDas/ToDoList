//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Geri-Das, Preman on 18/11/2024.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            StartView()
        }
    }
}
