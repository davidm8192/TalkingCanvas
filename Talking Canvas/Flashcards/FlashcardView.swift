//
//  FlashcardView.swift
//  Talking Canvas
//
//  Created by David Ma on 1/31/23.
//

import SwiftUI

/*struct FlashcardView: View {
    var flashcard: Flashcard
    @State private var wordHeight: CGFloat = 100

    private struct SizePreferenceKey: PreferenceKey {
            static var defaultValue: CGFloat = .zero
            static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
                value = min(value, nextValue())
            }
    }
    
    var body: some View {
        /*VStack {
            
            Text(flashcard.word)
                .padding(.top, 30.0)
                .font(.system(size: 500))
                .minimumScaleFactor(0.01)
                .lineLimit(1)
            
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
    }*/
    VStack(alignment: .leading) {
        ForEach(flashcard.word.split(separator: " ").map(String.init), id: \.self) { (word: String) in
            Text(word)
                .font(.largeTitle)
                .fontWeight(.bold)
                .scaledToFit()
                .minimumScaleFactor(0.01)
                .lineLimit(1)
                .background(GeometryReader {
                    Color.clear.preference(key: SizePreferenceKey.self, value: $0.size.height)
                })
                .frame(maxHeight: wordHeight)
        }
        Image(uiImage: flashcard.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
    }
    .onPreferenceChange(SizePreferenceKey.self, perform: { wordHeight = $0 })
        
}
}*/

struct FlashcardView: View {
    var flashcard: Flashcard
    
    var body: some View {
        VStack {
            Text(flashcard.word)
                .font(.headline)
                .scaledToFit()
                .minimumScaleFactor(0.01)
                .lineLimit(1)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.top, 30.0)
            Image(uiImage: flashcard.image)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 150)
                .clipped()
        }
        .frame(height: 150, alignment: .center)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

