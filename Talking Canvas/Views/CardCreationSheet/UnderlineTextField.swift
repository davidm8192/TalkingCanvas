//
//  UnderlineTextField.swift
//  Talking Canvas
//
//  Created by David Ma on 1/24/23.
//

import SwiftUI

struct UnderlineTextField: View {
    @Binding var text: String
    var placeholder: String
    @State private var isEditing = false

    var body: some View {
        VStack(alignment: .leading) {
            
            TextField(placeholder, text: $text, onEditingChanged: { isEditing in
                self.isEditing = isEditing
            })
                .padding(.leading, 20)
                .padding(.trailing, 20)

            Rectangle()
                .frame(height: isEditing ? 3 : 1)
                .foregroundColor(.black)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .animation(.easeOut(duration: 0.1))
        }
    }
}
