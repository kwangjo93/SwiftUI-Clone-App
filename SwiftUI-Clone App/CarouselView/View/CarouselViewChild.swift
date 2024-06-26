//
//  CarouselViewChild.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/30/24.
//

import SwiftUI

struct CarouselViewChild: View, Identifiable {
    var id: Int
    @ViewBuilder var content: any View
    var body: some View {
        ZStack {
            AnyView(content)
        }
        
    }
}

#Preview {
    CarouselView()
}
