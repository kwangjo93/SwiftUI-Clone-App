//
//  ExploreService.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/14/24.
//

import Foundation

class ExploreService {
    func fetchListings() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
