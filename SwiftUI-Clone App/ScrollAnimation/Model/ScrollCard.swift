//
//  ScrollCard.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/28/24.
//

import SwiftUI

struct ScrollCard: Identifiable {
    var id: UUID = .init()
    var bgColor: Color
    var balance: String
}

var cards: [ScrollCard] = [
    ScrollCard(bgColor: .red, balance: "$125,000"),
    ScrollCard(bgColor: .blue, balance: "$25,000"),
    ScrollCard(bgColor: .orange, balance: "$25,000"),
    ScrollCard(bgColor: .purple, balance: "$5,000"),
]
