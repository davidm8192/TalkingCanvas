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
                        .contextMenu(menuItems: {
                            Button(action: {
                                // show view for description
                            }, label: {
                                Label("Show Description", systemImage: "note.text")
                            })
                            Button(role: .destructive) {
                                withAnimation { () -> () in
                                    deleteFlashcard(id: flashcard.id)
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        })
                        //add .onDrag
                    
                    
                }.transition(AnyTransition.scale)
            }
        }
    }

    func deleteFlashcard(id: UUID) {
        if let index = flashcards.flashcardArray.firstIndex(where: { $0.id == id }) {
            flashcards.flashcardArray.remove(at: index)
        }
    }

    
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
            .environmentObject(Flashcards())
    }
}
