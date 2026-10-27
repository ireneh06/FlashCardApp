//
//  WordListView.swift
//  FlashCardApp
//
//  Created by Irene Hofer on 22.10.26.
//
import SwiftUI

struct WordListView: View {
    @Binding var flashcards: [Flashcard]
    
    var body: some View {
        NavigationStack {
            
            List(flashcards) { card in
                NavigationLink(value: card.id) {
                    Text(card.word)
                }
            }
            .navigationTitle("Words")
            .navigationDestination(for: UUID.self) { id in
                WordDetailView(id: id, flashcards: $flashcards)
            }
            
            
            //List(flashcards.indices, id: \.self) { i in //is unstable when index change
          
        }
    }
}

#Preview {
    //WordListView()
}
 //NavigationLink(value:) must match the type registered in .navigationDestination(for:)
