//
//  ContentView.swift
//  Talking Canvas
//
//  Created by David Ma on 1/21/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var flashcards = Flashcards()
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .home
    @State private var showSheet = false
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                TabBarContainerView(selection: $tabSelection) {
                    HomeView()
                        .tabBarItem(tab: .home, selection: $tabSelection)
                    SettingsView()
                        .tabBarItem(tab: .settings, selection: $tabSelection)
                }
            }
            
            Button(action: {
                self.showSheet = true
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
            
            .sheet(isPresented: $showSheet) {
                SheetView(showSheet: $showSheet, word: "", description: "")
            }
        }
        .environmentObject(flashcards)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
