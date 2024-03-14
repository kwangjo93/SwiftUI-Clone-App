//
//  ListingItemView.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/11/24.
//

import SwiftUI

struct ListingItemView: View {
   
    var body: some View {
        VStack(spacing: 8) {
           ListingImageCarouselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
    
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    HStack(spacing: 4) {
                        Text("$567")
                            .fontWeight(.semibold)
                        Text("night")
                    }//HStack
                    .foregroundStyle(.black)
                }//VStack
                Spacer()
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    Text("4.86")
                } //HStack
                .foregroundStyle(.black)
            } //HStack
            .font(.footnote)
        }//VStack
    }//body
}

#Preview {
    ListingItemView()
}
