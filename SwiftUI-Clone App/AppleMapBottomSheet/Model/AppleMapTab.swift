//
//  AppleMapTab.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/21/24.
//

import SwiftUI

enum AppleMapTab: String, CaseIterable {
    case people = "People"
    case devices = "Devices"
    case item = "Items"
    case me = "Me"
    
    var symbol: String {
        switch self {
        case .people:
            "figure.2.arms.open"
        case .devices:
            "macbook.and.iphone"
        case .item:
            "circle.grid.2x2.fill"
        case .me:
            "person.circle.fill"
        }
    }
}
