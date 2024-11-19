//
//  ToDoListCellView.swift
//  ToDoList
//
//  Created by Geri-Das, Preman on 18/11/2024.
//

import SwiftUI

struct ToDoListCellView: View {
    @StateObject var viewModel = ProfileViewModel()
    let item: ToDoListItem
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    .bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color.secondary)
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill"
                      : "circle")
            }
        }
    }
}

#Preview {
    ToDoListCellView(item: .init(id: "123",
                                 title: "get milk",
                                 dueDate: Date().timeIntervalSince1970,
                                 createdDate: Date().timeIntervalSince1970,
                                 isDone: false))
}
