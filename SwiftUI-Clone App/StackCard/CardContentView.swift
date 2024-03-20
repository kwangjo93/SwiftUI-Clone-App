//
//  ContentView.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/20/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isRotationEnabled: Bool = true
    var body: some View {
        NavigationStack {
            VStack {
                GeometryReader {
                    let size = $0.size
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 0) {
                            
                        }
                    }
                }
            }
            .navigationTitle("Stacked Cards")
        }
    }
}

#Preview {
    ContentView()
}
