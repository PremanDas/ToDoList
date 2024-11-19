//
//  TLButton.swift
//  ToDoList
//
//  Created by Geri-Das, Preman on 19/11/2024.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(background)
                
                Text(title)
                    .foregroundStyle(.white)
                    .bold()
            }
        })
    }
}

#Preview {
    TLButton(title: "Value", background: .pink) {
        print("Tapped")
    }
}
