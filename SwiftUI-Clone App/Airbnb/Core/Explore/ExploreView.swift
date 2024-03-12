//
//  ExploreView.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/11/24.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            VStack {
                SearchAndFilterBar()
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(0 ... 10, id: \.self) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView()
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }//LazyVStack
                    .padding()
                }//ScrollView
                .navigationDestination(for: Int.self) { listing in
                    Text("Listing detail View...")
                }
            }//VStack
        }//NavigationStack
    }
}

#Preview {
    ExploreView()
}
