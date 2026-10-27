//
//  FlashCardAppApp.swift
//  FlashCardApp
//
//  Created by Irene Hofer on 22.10.26.
//

import SwiftUI

@main
struct FlashCardAppApp: App {
    @State private var flashcards: [Flashcard] =
        loadSavedFlashcards() ?? loadFlashcards()
    
    var body: some Scene {
        WindowGroup {
            Group {
                    MainTabView(flashcards: $flashcards)
                    .onChange(of: flashcards) {
                        saveFlashcards(flashcards)
                }
            }
        
        }
    }
}
