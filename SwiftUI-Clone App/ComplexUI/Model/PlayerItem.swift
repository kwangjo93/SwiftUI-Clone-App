//
//  PlayerItem.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/20/24.
//

import SwiftUI

let dummyDescription: String = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"

struct PlayerItem: Identifiable, Equatable {
    let id: UUID = .init()
    var title: String
    var author: String
    var image: String
    var description: String = dummyDescription
}

var playerItems: [PlayerItem] = [
    .init(title: "Apple Vision Pro - Unboxing, Review and demos!",
          author: "iJustine",
          image: "star"),
    .init(title: "Hero Effect - Swift UI",
          author: "Kavsoft",
          image: "star.fill"),
    .init(title: "What Apple Vision Pro is really like",
          author: "iJustine",
          image: "person"),
    .init(title: "Draggable Map Pin",
          author: "Kavsoft",
          image: "person.fill"),
    .init(title: "Maps Bottom Sheet",
          author: "Kavsoft",
          image: "person.circle")
]
