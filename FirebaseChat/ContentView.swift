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

    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 25) {
                    VStack(spacing: 5) {
                        TextField("Name", text: $name)
                            .font(.system(size: 14, weight: .regular))
                            .frame(width: size.width - 50, height: 50)
                            .padding(.horizontal, 10)
                            .border(.black)
                            .background(.white)
                        
                        TextField("Password", text: $password)
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
                    
//                    Spacer()
                }
                
                GeometryReader { proxy in
                    HStack {}
                        .onAppear {
                            size = proxy.size
                        }
                }
                
                
            }
            .navigationTitle("Log in")
            .background(.purple)
            
        }
    }
}


#Preview {
    ContentView()
}
