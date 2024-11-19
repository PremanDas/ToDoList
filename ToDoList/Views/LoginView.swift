//
//  LoginView.swift
//  ToDoList
//
//  Created by Geri-Das, Preman on 18/11/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @FocusState private var focusField: FocusedField?
    
    enum FocusedField {
        case email, password
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                // Header
                HeaderView(title: "To Do List",
                           subtitle: "Get things done",
                           angle: 15,
                           backgroundColor: .pink)
                .padding(.top, 50)
                
                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .listRowSeparator(.hidden)
                        .padding(.top, 8)
                        .focused($focusField, equals: .email)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .listRowSeparator(.hidden)
                        .focused($focusField, equals: .password)
                    
                    TLButton(title: "Login",
                             background: .blue) {
                        viewModel.login()
                    }
                    .padding()
                }
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                .padding()
                .defaultFocus($focusField, .email)
                .offset(y: -80)
                // Create Account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account",
                                   destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    LoginView()
}
