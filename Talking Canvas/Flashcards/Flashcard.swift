//
//  Flashcard.swift
//  Talking Canvas
//
//  Created by David Ma on 1/31/23.
//

import SwiftUI

struct Flashcard: Identifiable {
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

class FlashcardManager {
  static let shared = FlashcardManager()
  private init() {}
  
  var flashcards: [Flashcard] = []
  
  func addFlashcard(flashcard: Flashcard) {
    flashcards.append(flashcard)
  }
}

