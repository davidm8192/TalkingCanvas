//
//  TabBarView.swift
//  Talking Canvas
//
//  Created by David Ma on 1/23/23.
//

import SwiftUI

struct TabBarView: View {
    
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem

    
    var body: some View {
        HStack(spacing: 30) {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
}

struct TabBarView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [
        .home, .settings
    ]
    
    static var previews: some View {
        VStack {
            Spacer()
            TabBarView(tabs: tabs, selection: .constant(tabs.first!))
        }
    }
}

extension TabBarView {
    
    private func tabView(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: selection == tab ? tab.iconNamePressed: tab.iconName)
                //.resizable()
                //.frame(width: 30, height: 30)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
        }
        .foregroundColor(selection == tab ? tab.color: Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(selection == tab ? tab.color.opacity(0.2): Color.clear)
        .cornerRadius(10)
    }
    
    private func switchToTab(tab: TabBarItem) {
        withAnimation(.easeInOut) {
            selection = tab
        }
    }
}

