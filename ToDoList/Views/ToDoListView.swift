//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Geri-Das, Preman on 18/11/2024.
//

import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewModel()
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(items) { item in
                    ToDoListCellView(item: item)
                        .swipeActions {
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                                    .foregroundStyle(.red
                                    )
                            }
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                AddToDo(newItemPresented: $viewModel.showingNewItemView)
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "w4ZLKflVCVSrTU1cNi5xNVUxL463")
}
