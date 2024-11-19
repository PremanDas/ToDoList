//
//  ContentView.swift
//  ToDoList
//
//  Created by Geri-Das, Preman on 18/11/2024.
//

import SwiftUI

struct StartView: View {
    @StateObject var viewModel = StartViewModel()
    
    var body: some View {
        if viewModel.isSignedIn && !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage:  "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    StartView()
}
