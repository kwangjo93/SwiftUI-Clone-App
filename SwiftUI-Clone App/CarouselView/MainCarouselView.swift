//
//  MainCarouselView.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/30/24.
//

import SwiftUI

struct MainCarouselView: View {
    var body: some View {
        ZStack {
            CarouselView()
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray)
    }

}

#Preview {
    MainCarouselView()
}
