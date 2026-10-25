//
//  MainTabView.swift
//  FlashCardApp
//
//  Created by Irene Hofer on 23.10.26.
//

import SwiftUI



struct MainTabView: View {
    
    @Binding var flashcards: [Flashcard]
    var body: some View {
        
        TabView {
                
                ContentView(flashcards: $flashcards)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    
                WordListView(flashcards: $flashcards)
                    .tabItem {
                        Label("Cards", systemImage: "rectangle.stack")
                    }
                
                SettingsView(flashcards: $flashcards)
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
        }
    }
}

#Preview {
    //MainTabView()
}
