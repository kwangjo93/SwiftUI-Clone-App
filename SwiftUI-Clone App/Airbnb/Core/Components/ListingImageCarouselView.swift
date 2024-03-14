//
//  ListingImageCarouselView.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/12/24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    let listing: Listing
    var body: some View {
        TabView {
            ForEach(listing.imageURLs, id: \.self) { image in
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(listing: DeveloperPreview.shared.listings[0])
}
