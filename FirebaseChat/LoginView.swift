//
//  ContentView.swift
//  FirebaseChat
//
//  Created by Paul Huynh on 2023-10-24.
//

import SwiftUI
import Firebase

class FirebaseManager: NSObject {
    
    let auth: Auth
    static let shared = FirebaseManager()
    
    override init() {
        FirebaseApp.configure()
        
        self.auth = Auth.auth()
        super.init()
    }
}

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @State var isLoginMode = false
    @State var loginStatusMessage = ""

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
                            TextField("Email", text: $email)
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
                    
                    Text(self.loginStatusMessage)
                        .foregroundStyle(Color.red)
                }
                .padding(.horizontal)
            }
            .navigationTitle( isLoginMode ? "Log in" : "Create Account")
            .background(Color(.init(white: 0, alpha: 0.05)).ignoresSafeArea())
            
        }
    }
    
    private func handleAction() {
        if isLoginMode {
            loginUser()
        } else {
            createNewAccount()
        }
    }
    
    private func loginUser() {
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { res, err in
            if let err = err {
                print("failed to login user:", err)
                self.loginStatusMessage = "failed to login user:, \(err)"
                return
            }
            
            print("Successfully login user \(res?.user.uid ?? "")")
            self.loginStatusMessage = "Successfully login user: \(res?.user.uid ?? "")"
        }
    }
    
    private func createNewAccount() {
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { res, err in
            if let err = err {
                print("failed to create user:", err)
                self.loginStatusMessage = "failed to create user:, \(err)"
                return
            }
            
            print("Successfully created user \(res?.user.uid ?? "")")
            self.loginStatusMessage = "Successfully created user: \(res?.user.uid ?? "")"
        }
    }
}


#Preview {
    LoginView()
}
