//
//  SheetView.swift
//  Talking Canvas
//
//  Created by David Ma on 1/23/23.
//

import SwiftUI

struct SheetView: View {
    
    @State private var isShowing = false
    @State var selectedImage: UIImage?
    @State var word: String
    @State var description: String
    
    var body: some View {
        
        NavigationView {
            VStack {
                ToolBarView()
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
                    
                    .padding(12)
                
            }
         
            //For tool bar: see if there's a way
            // to close sheet by sliding it down
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(Color.red)
                    }
                    Button(action: {
                        hideKeyboard()
                    }) {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    Button(action: {
                        //save data
                        //close sheet
                    }) {
                        Text("Done")
                    }
                }
            }
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

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView(word: "", description: "")
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
