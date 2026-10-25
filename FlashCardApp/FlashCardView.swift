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
                        
                    if let definition = flashcards[index].definition {
                        Divider()
                        Text(definition).font(.title2)
                        }
                        
                        if let example = flashcards[index].example {
                        Divider()
                        Text(example).font(.title2)
                    }
                    
                        Spacer()
                }
            }
        }
       .padding(20)
       .frame(maxWidth: .infinity, maxHeight: .infinity)
       .background(Color(red: 0.82, green: 0.91, blue: 1.0))
       .cornerRadius(30)

    }
       
}

#Preview {
    //FlashCardView(flashcards: $flashcards, index: .constant(0))
}
