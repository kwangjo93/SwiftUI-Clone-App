//
//  PlayerConfig.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/20/24.
//

import SwiftUI

struct PlayerConfig: Equatable {
    var position: CGFloat = .zero
    var lastPosition: CGFloat = .zero
    var progress: CGFloat = .zero
    var selectedPlayerItem: PlayerItem?
    var showMioniPlayer: Bool = false
    
    mutating func resetPosition() {
        position = .zero
        lastPosition = .zero
        progress = .zero
    }
}

