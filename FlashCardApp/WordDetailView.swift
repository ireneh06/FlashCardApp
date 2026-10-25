//
//  WordDetailView.swift
//  FlashCardApp
//
//  Created by Irene Hofer on 23.10.26.
//

import SwiftUI

struct WordDetailView: View {
    let id: UUID
    @Binding var flashcards: [Flashcard]
    
    var body: some View {
        if let index = flashcards.firstIndex(where: { $0.id == id }) {
            VStack(alignment: .leading) {
                Form {
                    Section("Edit Vocabulary") {
                        TextField("Word", text: $flashcards[index].word)
                        TextField("Translation", text: $flashcards[index].translation)
                        Toggle("Already known", isOn: $flashcards[index].isKnown)
                        
                        }
                    }
                }
                
            } else {
                Text("Card not found")
            }
        Spacer()
    }
}

#Preview {
    
    //WordDetailView(id: flashcards[0].id, flashcards: $flashcards)
}
