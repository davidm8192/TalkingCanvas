//
//  GridView.swift
//  Talking Canvas
//
//  Created by David Ma on 1/30/23.
//

import SwiftUI

struct GridView: View {
    
    @EnvironmentObject var flashcardmanager: FlashcardManager
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach(FlashcardManager.flashcards, id: \.id) { flashcard in
                    FlashcardView(flashcard: flashcard)
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
