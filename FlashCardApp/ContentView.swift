//
//  ContentView.swift
//  FlashCardApp
//
//  Created by Irene Hofer on 22.10.26.
//

import SwiftUI



struct ContentView: View {
    @State var index: Int = 0 //state - owns value & swift ui redraws on change
    @State private var selectedTab = 0
    @Binding var flashcards: [Flashcard]
    
    var body: some View {
        VStack {
            Text("FlashCard App").font(.largeTitle)
            HStack{
                Button(){
                    index = (index - 1 + flashcards.count) % flashcards.count
                } label: {
                    Image(systemName: "chevron.compact.left")
                        .font(.system(size: 28))
                }
                FlashCardView(flashcards: $flashcards, index: $index)
                Button(){
                    index = (index + 1) % flashcards.count
                } label: {
                    Image(systemName: "chevron.compact.right")
                        .font(.system(size: 28))
                }
            }
            
            HStack{
                Button (){
                    flashcards[index].isKnown = false
                    index = (index + 1) % flashcards.count
                } label: {
                    Image(systemName: "hand.thumbsdown")
                        .font(.system(size: 28))
                }
                .padding(10)
                Spacer()
                Button (){
                    flashcards[index].isKnown = true
                    index = (index + 1) % flashcards.count
                } label: {
                    Image(systemName: "hand.thumbsup")
                        .font(.system(size: 28))
                }
                .padding(10)
            }
            .padding(30)
        }
        .padding(25)
        
    }
}

#Preview {
    //ContentView()
}
