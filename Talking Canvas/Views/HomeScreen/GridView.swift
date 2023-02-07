//
//  GridView.swift
//  Talking Canvas
//
//  Created by David Ma on 1/30/23.
//

import SwiftUI

struct GridView: View {
    
    @EnvironmentObject var flashcards: Flashcards
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        /*let word = "TONGUE"
        let description = "NOTHING"
        let image = UIImage(named: "Jessie_Lickitung")*/
        
        /*ScrollView {
            VStack {
                Text("Flashcards: \(flashcards.flashcardArray.count)")
                Button {
                    let flashcard = Flashcard(word: word, description: description, image: image!)
                    flashcards.flashcardArray.append(flashcard)

                } label: {
                    Text("BUTTON")
                }
            }
        }*/
        
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach(flashcards.flashcardArray) { flashcard in
                    FlashcardView(flashcard: flashcard)
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
            .environmentObject(Flashcards())
    }
}
