//
//  FlashcardView.swift
//  Talking Canvas
//
//  Created by David Ma on 1/31/23.
//

import SwiftUI

struct FlashcardView: View {
    var flashcard: Flashcard

    var body: some View {
        VStack {
            
            Text(flashcard.word)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.top, 30.0)
            
            /*if(flashcard.description != "") {
                Text(flashcard.description)
                    .font(.body)
                    .padding()
            }*/
             
            Image(uiImage: flashcard.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
