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
    @State private var showAddCard = false
    
    var body: some View {
        
        if flashcards.isEmpty {
            VStack(spacing: 12) {
                Text("No flashcards yet")
                    .font(.title2)
                Button {
                    showAddCard = true
                } label: {
                    Label("Add your first card", systemImage: "plus.app")
                }
            }
        } else {
            VStack {
                HStack{
                    Text("FlashCard App").font(.largeTitle)
                    Spacer()
                    Button{
                        showAddCard = true
                        //AddCardView(flashcards: $flashcards) //addcard view is created in button
                    } label: {
                        Image(systemName: "plus.app")
                            .font(.system(size: 28))
                    }
                    .sheet(isPresented: $showAddCard) {
                        AddCardView(flashcards: $flashcards)
                    }
                }
                
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
                    Spacer()
                    Button (){
                        flashcards[index].isKnown = true
                        index = (index + 1) % flashcards.count
                    } label: {
                        Image(systemName: "hand.thumbsup")
                            .font(.system(size: 28))
                    }
                }
                .padding(20)
            }
            .padding(20)
            .onChange(of: flashcards) {
                if flashcards.isEmpty {
                    index = 0
                } else {
                    index = min(index, flashcards.count - 1)
                }
            }
            
        }
    }
}

#Preview {
    //ContentView()
}
