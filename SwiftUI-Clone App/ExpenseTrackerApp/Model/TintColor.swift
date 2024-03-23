//
//  TintColor.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/22/24.
//

import SwiftUI

struct TintColor: Identifiable {
    let id: UUID = .init()
    let color: String
    let value: Color
}

var tints: [TintColor] = [
    .init(color: "Red", value: .red),
    .init(color: "Blue", value: .blue),
    .init(color: "Pink", value: .pink),
    .init(color: "Purple", value: .purple),
    .init(color: "brwon", value: .brown),
    .init(color: "Orange", value: .orange),
]
