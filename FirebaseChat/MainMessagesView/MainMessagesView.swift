//
//  MainMessagesView.swift
//  FirebaseChat
//
//  Created by Paul Huynh on 2023-12-09.
//

import SwiftUI

struct MainMessagesView: View {
    @State var shouldShowLogOutOptions = false
    
    private var customNavBar: some View {
        VStack {
            HStack {
                Image(systemName: "person")
                    .font(.system(size: 34, weight: .heavy))
                
                VStack(alignment: .leading ,spacing: 4) {
                    Text("UserName")
                        .font(.system(size: 24, weight: .bold))
                    HStack {
                        Circle()
                            .foregroundColor(.green)
                            .frame(width: 12, height: 12)
                        Text("Online")
                            .font(.system(size: 12))
                            .foregroundStyle(.gray)
                    }
                }
                
                Spacer()
                
                Button {
                    shouldShowLogOutOptions.toggle()
                } label: {
                    Image(systemName: "gear")
                        .font(.system(size: 24, weight: .bold))
                }

            }
            Divider()
        }
        .padding()
        .confirmationDialog("settings", isPresented: $shouldShowLogOutOptions) {
            Button("Sign Out", role: .destructive) {
                print("sign out")
            }
            .background(.red)

        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                customNavBar
                messagesView
            }
            .overlay(alignment: .bottom) {
                newMessageButton
            }
            .navigationBarHidden(true)
        }
    }
}

private var messagesView: some View {
    ScrollView {
        ForEach(0..<10, id: \.self) { num in
            VStack {
                HStack(spacing: 25) {
                    Image(systemName: "person.fill")
                        .font(.system(size: 30))
                        .padding(6)
                        .overlay(RoundedRectangle(cornerRadius: 44)
                            .stroke(Color(.label), lineWidth: 1))
                    
                    
                    VStack(alignment: .leading) {
                        Text("UserName")
                            .font(.system(size: 24, weight: .bold))
                        Text("Message sent to user")
                            .font(.system(size: 14))
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    Text("22d")
                        .font(.system(size: 14, weight: .semibold))
                }
                Divider()
                    .padding(.vertical, 8)
            }
            .padding(.horizontal)
        }
        .padding(.bottom, 50)
    }
}

private var newMessageButton: some View {
    Button {
        
    } label: {
        HStack {
            Spacer()
            Text("+ New Message")
            Spacer()
        }
        .foregroundColor(.white)
        .padding(.vertical)
        .background(.blue)
        .cornerRadius(32)
        .padding(.horizontal)
        .shadow(radius: 15)
    }
}

#Preview {
    MainMessagesView()
        .preferredColorScheme(.dark)
}
