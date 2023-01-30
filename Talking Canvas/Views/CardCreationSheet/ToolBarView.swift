//
//  ToolBarView.swift
//  Talking Canvas
//
//  Created by David Ma on 1/24/23.
//

import SwiftUI

struct ToolBarView: View {
    var body: some View {
        ZStack {
            HStack(spacing: 20) {
                Button(action: {
                    
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
                    //save data
                    //close sheet
                }) {
                    Text("Done")
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

struct ToolBarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolBarView()
    }
}
