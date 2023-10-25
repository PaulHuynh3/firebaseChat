//
//  ContentView.swift
//  FirebaseChat
//
//  Created by Paul Huynh on 2023-10-24.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @State var isLoginMode = false

    var body: some View {
        NavigationView {
            ScrollView {
                Picker("Picker", selection: $isLoginMode) {
                    Text("Login")
                        .tag(true)
                    Text("Create Account")
                        .tag(false)
                }
                .pickerStyle(.segmented)
                .padding()
                
                VStack(spacing: 25) {
                    if !isLoginMode {
                        Button {
                            
                        } label: {
                            ZStack {
                                Circle()
                                    .frame(width: 150, height: 150)
                                    .background(.orange)
                                
                                Image(systemName: "person.fill")
                                    .font(.system(size: 64))
                                    .padding()
                                    .tint(.black)
                            }
                            .background(.purple)
                            
                        }
                    }
                    VStack(spacing: 5) {
                        Group {
                            TextField("Name", text: $email)
                            SecureField("Password", text: $password)
                        }
                        .font(.system(size: 14, weight: .regular))
                        .padding(12)
                        .background(.white)
                    }
                    
                    Button {
                        //action
                        handleAction()
                    } label: {
                        HStack {
                            Spacer()
                            Text(isLoginMode ? "Log in" : "Create Account")
                                .foregroundStyle(.white)
                                .padding(.vertical, 10)
                                .font(.system(size: 14, weight: .semibold))
                            Spacer()
                        }

                    }
                    .background(.blue)
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            .navigationTitle( isLoginMode ? "Log in" : "Create Account")
            .background(Color(.init(white: 0, alpha: 0.05)).ignoresSafeArea())
            
        }
    }
    
    private func handleAction() {
        if isLoginMode {
            print("should log into firebase with existing cred")
        } else {
            print("create new user on firebase")
        }
    }
}


#Preview {
    LoginView()
}
