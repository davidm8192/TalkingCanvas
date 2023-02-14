//
//  SheetView.swift
//  Talking Canvas
//
//  Created by David Ma on 1/23/23.
//

import SwiftUI

struct SheetView: View {
    
    @Binding var showSheet: Bool
    @State private var isShowing = false
    @State var selectedImage: UIImage?
    @State var word: String
    @State var description: String
    
    var body: some View {
        
        VStack {
            ToolBarView(showSheet: $showSheet, selectedImage: $selectedImage, word: $word, description: $description)
            Spacer()
            TextFieldLayout
            VStack(spacing: 20) {
                
                if(selectedImage != nil) {
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
                
                Button(action: {
                    isShowing.toggle()
                }) {
                    if(selectedImage == nil) {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color.black)
                    }
                }
                .sheet(isPresented: $isShowing, onDismiss: nil) {
                    ImagePicker(selectedImage: $selectedImage, isShowing: $isShowing)
                }
                
            }
            Spacer()
            .padding(12)
            
        }
        
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    private var TextFieldLayout: some View {
        VStack(spacing: 30) {
            UnderlineTextField(text: $word, placeholder: "Word")
            UnderlineTextField(text: $description, placeholder: "Description (optional)")
        }
        .padding(.top, 20.0)
        .padding(.bottom, 30.0)
        .overlay (
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(Color.gray, lineWidth: 3)
        )
        .padding(10)
    }
    
}

/*struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView(showSheet: true, word: "", description: "")
    }
}*/

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
