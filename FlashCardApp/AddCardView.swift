//
//  AddCardView.swift
//  FlashCardApp
//
//  Created by Irene Hofer on 25.10.26.
//

import SwiftUI

struct AddCardView: View {
    @State private var newFlash: Flashcard
    
    @Binding var flashcards: [Flashcard]
    @Environment(\.dismiss) private var dismiss
    
    
    init(flashcards: Binding<[Flashcard]>) {
            self._flashcards = flashcards

            self._newFlash = State(initialValue: Flashcard(
                word: "",
                translation: "",
                definition: "",
                example: "",
                isKnown: false
            ))
        }
    
    var body: some View {
            Form {
                Section("New Vocabulary") {
                    TextField("Word", text: $newFlash.word)
                    TextField("Translation", text: $newFlash.translation)
                    TextField("Definition", text: $newFlash.definition)
                    TextField("Example", text: $newFlash.example)
//                                Binding( //if optional
//                        get: { newFlash.example ?? "" },
//                        set: { newFlash.example = $0 }
//                    ))
                    
                    Toggle("Already known", isOn: $newFlash.isKnown)
                    
                    
                    let canSave = !newFlash.word.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
                              !newFlash.translation.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                    
                    Button ("Save", role: .confirm) {
                        
                        newFlash.word = newFlash.word.trimmingCharacters(in: .whitespacesAndNewlines)
                        newFlash.translation = newFlash.translation.trimmingCharacters(in: .whitespacesAndNewlines)
                        newFlash.definition = newFlash.definition.trimmingCharacters(in: .whitespacesAndNewlines)
                        newFlash.example = newFlash.example.trimmingCharacters(in: .whitespacesAndNewlines)
                        
                        flashcards.append(newFlash)
                        dismiss() //go to prev view
                    }
                    .disabled(!canSave)
                }
            }
            
        }
}

#Preview {

}
