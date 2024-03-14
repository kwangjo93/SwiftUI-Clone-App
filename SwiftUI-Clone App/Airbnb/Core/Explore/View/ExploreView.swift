//
//  ExploreView.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/11/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    var body: some View {
        NavigationStack {
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView, viewModel: viewModel)
            } else {
                VStack {
                    SearchAndFilterBar(location: $viewModel.searchLocation)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(viewModel.listing) { listing in
                                NavigationLink(value: listing) {
                                    ListingItemView(listing: listing)
                                        .frame(height: 400)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                }
                            }
                        }//LazyVStack
                        .padding()
                    }//ScrollView
                    .navigationDestination(for: Listing.self) { listing in
                        ListingDetailView(listing: listing)
                            .navigationBarBackButtonHidden()
                    }
                }//VStack
            }
        }//NavigationStack
    }
}

#Preview {
    ExploreView()
}
