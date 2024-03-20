//
//  CardItem.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/20/24.
//

import SwiftUI

struct CardItem: Identifiable {
    var id: UUID = .init()
    var color: Color
}

var items: [CardItem] = [
    .init(color: .red),
    .init(color: .blue),
    .init(color: .green),
    .init(color: .yellow),
    .init(color: .pink),
    .init(color: .purple),
]

extension [CardItem] {
    func zIndex(_ item: CardItem) -> CGFloat {
        if let index = firstIndex(where: { $0.id == item.id }) {
            return CGFloat(count) - CGFloat(index)
        }
        return .zero
    }
}
