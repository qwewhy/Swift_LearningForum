//
//  ContentView.swift
//  LearnForum
//
//  Created by Hongyuan Wang on 29/4/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello")
                Text("Git")
            }
            .padding()
            .tabItem { 
                Label("Home", systemImage: "house") 
            }
            
            QuestionBankView()
                .tabItem {
                    Label("Question Banks", systemImage: "folder")
                }
        }
    }
}

#Preview {
    ContentView()
}
