//
//  MainMessagesView.swift
//  FirebaseChat
//
//  Created by Paul Huynh on 2023-12-09.
//

import SwiftUI

struct MainMessagesView: View {
    var body: some View {
        NavigationView {
            VStack {
                //Custom Nav bar
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
                        Image(systemName: "gear")
                            .font(.system(size: 15))
                    }
                    Divider()
                }
                .padding(.horizontal)
                
                
                ScrollView {
                    ForEach(0..<10, id: \.self) { num in
                        VStack {
                            HStack(spacing: 25) {
                                Image(systemName: "person.fill")
                                    .font(.system(size: 30))
                                    .padding(6)
                                    .overlay(RoundedRectangle(cornerRadius: 44)
                                        .stroke(Color.black, lineWidth: 1))
                                
                                
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
                }
                
                Button {
                    
                } label: {
                    HStack {
                        Spacer()
                        Text("+ New Message")
                        Spacer()
                    }
                }
                .foregroundColor(.white)
                .padding(.vertical)
                .background(.blue)
                .cornerRadius(32)
                .padding(.horizontal)
                
                

                
               
            }.navigationBarHidden(true)
        }
    }
}

#Preview {
    MainMessagesView()
}
