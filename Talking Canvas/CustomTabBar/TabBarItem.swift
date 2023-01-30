//
//  TabBarItem.swift
//  Talking Canvas
//
//  Created by David Ma on 1/23/23.
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    case home, settings
    
    var iconName: String {
        switch self {
        case .home: return "house"
        case .settings: return "gearshape"
        }
    }
    
    var iconNamePressed: String {
        switch self {
        case .home: return "house.fill"
        case .settings: return "gearshape.fill"
        }
    }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .settings: return "Settings"
        }
    }
    
    var color: Color {
        switch self {
        case .home: return Color.red
        case .settings: return Color.green
        }
    }
}
