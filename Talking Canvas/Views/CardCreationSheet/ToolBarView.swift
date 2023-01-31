//
//  ToolBarView.swift
//  Talking Canvas
//
//  Created by David Ma on 1/24/23.
//

import SwiftUI

struct ToolBarView: View {
    
    @Binding var showSheet: Bool
    @Binding var selectedImage: UIImage?
    @Binding var word: String
    @Binding var description: String
    @State private var showAlert = false
    
    var body: some View {
        ZStack {
            HStack(spacing: 20) {
                Button(action: {
                    showSheet = false
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(Color.red)
                }
                Spacer()
                Button(action: {
                    hideKeyboard()
                }) {
                    Image(systemName: "keyboard.chevron.compact.down")
                }
                Button(action: {
                    if selectedImage == nil || word.isEmpty {
                        self.showAlert = true
                    }
                    else {
                        let flashcard = Flashcard(word: word, description: description, image: selectedImage!)
                        FlashcardManager.shared.addFlashcard(flashcard: flashcard)
                        showSheet = false
                    }
                }) {
                    Text("Done")
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text("Please enter a word and image"), dismissButton: .default(Text("OK")))
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.horizontal, 20.0)
            .padding(.vertical, 10.0)
            
            Text("Create Card")
                .font(.headline)
                .fontWeight(.bold)
        }
    }
}


