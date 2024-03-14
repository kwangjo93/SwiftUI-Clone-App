//
//  ExploreViewModel.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/14/24.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listing = [Listing]()
    private let service: ExploreService
    
    init(service: ExploreService) {
        self.service = service
        
        Task { await fetchListing()}
    }
    
    func fetchListing() async {
        do {
            self.listing = try await service.fetchListings()
        } catch {
            print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
}
