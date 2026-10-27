//
//  FlashCardView.swift
//  FlashCardApp
//
//  Created by Irene Hofer on 22.10.26.
//

import SwiftUI

struct FlashCardView: View {
    @Binding var flashcards : [Flashcard]
    @Binding var index: Int //receives acces to value stored in another view
    @State private var isFrontSide = true
    
    var body: some View {
        if flashcards.indices.contains(index) {
            
            Button {
                isFrontSide.toggle()
            } label: {
                VStack {
                    if isFrontSide {
                        Text(flashcards[index].word)
                            .font(.largeTitle)
                    } else {
                        Spacer()
                        Text(flashcards[index].translation).font(.largeTitle)
                        
                        if !flashcards[index].definition.isEmpty {
                            Divider()
                            Text(flashcards[index].definition).font(.title2)
                        }
                        
                        if !flashcards[index].example.isEmpty {
                            Divider()
                            Text(flashcards[index].example).font(.title2)
                        }
                        
                        Spacer()
                    }
                }
                .padding(20)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(red: 0.82, green: 0.91, blue: 1.0))
                .cornerRadius(30)
            }
            .buttonStyle(.plain)

        } else {
            Text("Keine Flashcard verfügbar")
        }
    }
    
}

#Preview {
    //FlashCardView(flashcards: , index: .constant(0))
}
