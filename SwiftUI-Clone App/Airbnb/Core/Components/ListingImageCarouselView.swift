//
//  ListingImageCarouselView.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/12/24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    var images = [
    "star",
    "person",
    "star.fill",
    "pencil"
    ]
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { image in
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView()
}
