//
//  Flashcard.swift
//  Talking Canvas
//
//  Created by David Ma on 1/31/23.
//

import SwiftUI

class Flashcard: Identifiable {
  var id = UUID()
  var word: String
  var description: String
  var image: UIImage
  
  init(word: String, description: String, image: UIImage) {
    self.word = word
    self.description = description
    self.image = image
  }
}

@MainActor class Flashcards: ObservableObject {
    @Published var flashcardArray: [Flashcard]
    
    init() {
        flashcardArray = []
    }
}
