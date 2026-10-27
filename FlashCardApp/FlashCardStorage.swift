//
//  FlashCardStorage.swift
//  FlashCardApp
//
//  Created by Irene Hofer on 27.10.26.
//

import Foundation

func saveFlashcards(_ flashcards: [Flashcard]) {
    if let data = try? JSONEncoder().encode(flashcards) {
        UserDefaults.standard.set(data, forKey: "flashcards")
    }
}

func loadSavedFlashcards() -> [Flashcard]? {
    guard let data = UserDefaults.standard.data(forKey: "flashcards"),
          let flashcards = try? JSONDecoder().decode(
              [Flashcard].self,
              from: data
          ) else {
        return nil
    }

    return flashcards
}
