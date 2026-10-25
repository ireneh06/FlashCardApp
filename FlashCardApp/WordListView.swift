//
//  Words.swift
//  FlashCardApp
//
//  Created by Irene Hofer on 22.10.26.
//
import SwiftUI

struct WordListView: View {
    @Binding var flashcards: [Flashcard]
    
    var body: some View {
        NavigationStack {
            List(flashcards.indices, id: \.self) { i in
                
                NavigationLink(value: flashcards[i].id) {
                    Text(flashcards[i].word)
                }
            }
            .navigationTitle("Words")
            .navigationDestination(for: UUID.self) { id in
                WordDetailView(id: id, flashcards: $flashcards)
            }
        }
    }
}

#Preview {
    //WordListView()
}
 //NavigationLink(value:) must match the type registered in .navigationDestination(for:)
