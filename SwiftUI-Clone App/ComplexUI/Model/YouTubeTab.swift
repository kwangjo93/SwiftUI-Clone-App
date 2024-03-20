//
//  YouTubeTab.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/20/24.
//

import SwiftUI

enum YouTubeTab: String, CaseIterable {
    case home = "Home"
    case shorts = "Shorts"
    case subscriptions = "Subscriptions"
    case you = "You"
    
    var symbol: String {
        switch self {
        case .home:
            "house.fill"
        case .shorts:
            "video.badge.waveform.fill"
        case .subscriptions:
            "play.square.stack.fill"
        case .you:
            "person.circle.fill"
        }
    }
}
