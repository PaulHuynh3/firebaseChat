//
//  ContentView.swift
//  FirebaseChat
//
//  Created by Paul Huynh on 2023-10-24.
//

import SwiftUI

struct ContentView: View {
    @State var name = ""
    @State var password = ""
    @State var size: CGSize = .zero
    
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
                .frame(height: 30)
                .background(.gray)
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
                        TextField("Name", text: $name)
                            .font(.system(size: 14, weight: .regular))
                            .frame(width: size.width - 50, height: 50)
                            .padding(.horizontal, 10)
                            .border(.black)
                            .background(.white)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        
                        SecureField("Password", text: $password)
                            .font(.system(size: 14, weight: .regular))
                            .frame(width: size.width - 50, height: 50)
                            .padding(.horizontal, 10)
                            .border(.black)
                            .background(.white)
                    }
                    
                    Button {
                        //action
                    } label: {
                        Text("Log in")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundStyle(.white)
                        
                    }
                    .frame(width: size.width - 50, height: 50)
                    .padding(.horizontal, 10)
                    .background(.blue)
                    
                    Spacer()
                }

                GeometryReader { proxy in
                    HStack {}
                        .onAppear {
                            size = proxy.size
                        }
                }
                
                
            }
            .navigationTitle( isLoginMode ? "Log in" : "Create Account")
            .background(.purple)
            
        }
    }
}


#Preview {
    ContentView()
}
