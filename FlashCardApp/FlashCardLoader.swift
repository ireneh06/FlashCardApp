//
//  FlashCardLoader.swift
//  FlashCardApp
//
//  Created by Irene Hofer on 23.10.26.
//

import Foundation

func loadFlashcards() -> [Flashcard] {
    guard let url = Bundle.main.url(
        forResource: "words",
        withExtension: "json"
    ) else {
        print("JSON-Datei nicht gefunden")
        return []
    }

    do {
        let data = try Data(contentsOf: url)
        let decodedFlashcards = try JSONDecoder().decode(
                    [FlashcardData].self,
                    from: data
                )

        return decodedFlashcards.map {
            Flashcard(data: $0)
        }
    } catch {
        print("Fehler beim Laden: \(error)")
        return []
    }
}
