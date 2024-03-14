//
//  ListingItemView.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/11/24.
//

import SwiftUI

struct ListingItemView: View {
    let listing: Listing
    var body: some View {
        VStack(spacing: 8) {
            ListingImageCarouselView(listing: listing)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
    
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    HStack(spacing: 4) {
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        Text("night")
                    }//HStack
                    .foregroundStyle(.black)
                }//VStack
                Spacer()
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    Text("\(listing.rating)")
                } //HStack
                .foregroundStyle(.black)
            } //HStack
            .font(.footnote)
        }//VStack
    }//body
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
