
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
    @Environment(\.dismiss) private var dismiss

    @State private var word = ""
    @State private var translation = ""
    @State private var definition = ""
    @State private var example = ""
    @State private var isKnown = false

    var body: some View {
        Form {
            Section() {
                
                TextField("Word", text: $word)
                
                TextField("Translation", text: $translation)
                
                TextEditor(text: $definition)
                    .frame(minHeight: 100)
                
                TextEditor(text: $example)
                    .frame(minHeight: 100)
                
                Toggle("Already known", isOn: $isKnown)
                
                
                Button(role: .destructive) {
                    if let currentIndex = flashcards.firstIndex(
                        where: { $0.id == id }
                    ) {
                        flashcards.remove(at: currentIndex)
                    }
                    
                    dismiss()
                } label: {
                    Image(systemName: "doc.on.trash")
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                        .contentShape(Rectangle())
                }
                .tint(.red)
                
                Button(role: .confirm) {
                    if let currentIndex = flashcards.firstIndex(
                        where: { $0.id == id }
                    ) {
                        flashcards[currentIndex].word = word
                        flashcards[currentIndex].translation = translation
                        flashcards[currentIndex].definition = definition
                        flashcards[currentIndex].example = example
                        flashcards[currentIndex].isKnown = isKnown
                    }
                    
                    dismiss()
                } label: {
                    Image(systemName: "square.and.arrow.down")
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                        .contentShape(Rectangle())
                }
                .tint(.blue)
                
            }
        }
        .navigationTitle("Edit Vocabulary")
        .onAppear {
            if let currentIndex = flashcards.firstIndex(
                where: { $0.id == id }
            ) {
                word = flashcards[currentIndex].word
                translation = flashcards[currentIndex].translation
                definition = flashcards[currentIndex].definition
                example = flashcards[currentIndex].example
                isKnown = flashcards[currentIndex].isKnown
            }
        }
    }
}

#Preview {
    // Preview mit einer Test-Flashcard ergänzen
}
