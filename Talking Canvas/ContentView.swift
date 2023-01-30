//
//  ContentView.swift
//  Talking Canvas
//
//  Created by David Ma on 1/21/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .home
    @State private var isSheetShowing = false
    
    var body: some View {
        ZStack {
            TabBarContainerView(selection: $tabSelection) {
                HomeView()
                    .tabBarItem(tab: .home, selection: $tabSelection)
                SettingsView()
                    .tabBarItem(tab: .settings, selection: $tabSelection)
            }
    
            Button(action: {
                self.isSheetShowing = true
            }) {
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80)
                        .shadow(radius: 2)
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundColor(Color.green)
                        .frame(width: 72, height: 72)
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .sheet(isPresented: $isSheetShowing) {
                SheetView(word: "", description: "")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
