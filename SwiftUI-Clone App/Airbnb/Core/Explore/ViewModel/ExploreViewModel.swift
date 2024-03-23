//
//  ExploreViewModel.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/14/24.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listing = [Listing]()
    @Published var searchLocation = ""
    private let service: ExploreService
    private var listingsCopy = [Listing]()
    
    init(service: ExploreService) {
        self.service = service
        
//        Task {
//            await fetchListing()
//        }
    }
    
    func fetchListing() async {
        do {
            self.listing = try await service.fetchListings()
            self.listingsCopy = listing
        } catch {
            print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
    
    func updateListingsForLocation() {
        let filteredListings = listing.filter { $0.city.lowercased() == searchLocation.lowercased() ||
            $0.state.lowercased() == searchLocation.lowercased()}
        
        self.listing = filteredListings.isEmpty ? listing : filteredListings
    }
    
}
