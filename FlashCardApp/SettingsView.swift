//
//  SettingsView.swift
//  FlashCardApp
//
//  Created by Irene Hofer on 23.10.26.
//

import SwiftUI

struct SettingsView : View {
    
    @Binding var flashcards: [Flashcard]
    
    var body: some View {
        VStack{
            Text("Overview")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.largeTitle)
            let knownWords = flashcards.filter {
                $0.isKnown
            }.count

            let totalWords = flashcards.count
            ProgressViewCard(knownWords: knownWords, totalWords: totalWords)
                .padding(10)
            Spacer()
        }
        .padding(20)
    }
}

#Preview {
    //SettingsView()
}
