//
//  FlashCardAppApp.swift
//  FlashCardApp
//
//  Created by Irene Hofer on 22.10.26.
//

import SwiftUI

@main
struct FlashCardAppApp: App {
    @State private var flashcards = loadFlashcards()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if flashcards.isEmpty {
                    Text("Keine Flashcards gefunden")
                } else {
                    MainTabView(flashcards: $flashcards)
                }
            }
        
        }
    }
}
