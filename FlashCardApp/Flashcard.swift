//
//  Card.swift
//  FlashCardApp
//
//  Created by Irene Hofer on 22.10.26.
//

import Foundation

struct FlashcardData: Decodable {
    let word: String
    let translation: String
    let definition: String
    let example: String
}

struct Flashcard : Identifiable {
    var word: String
    var translation: String
    var definition: String?
    var example: String?
    var isKnown: Bool = false
    let id = UUID()
    
    
    init(word: String, translation: String, definition: String?, example: String?, isKnown: Bool = false) {
        self.word = word
        self.translation = translation
        self.definition = definition
        self.example = example
        self.isKnown = isKnown
    }
    
    init(word: String, translation: String) {
        self.word = word
        self.translation = translation
        self.definition = nil
        self.example = nil
        self.isKnown = false
    }
    
    init(data: FlashcardData) {
            word = data.word
            translation = data.translation
            definition = data.definition
            example = data.example
    }
}

//Identifiable: every element has unique id
//Decodable: type can be decoded from an external data format into a Swift object
