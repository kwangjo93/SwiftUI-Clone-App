//
//  MiniPlayerView.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/20/24.
//

import SwiftUI

struct MiniPlayerView: View {
    var size: CGSize
    @Binding var config: PlayerConfig
    var body: some View {
        Rectangle()
            .fill(.background)
            .clipped()
            .contentShape(.rect)
            .offset(y: config.progress * -tabBarHeight)
            .frame(height: size.height - config.position, alignment: .top)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .gesture(
            DragGesture()
                .onChanged({ value in
                    let height = value.translation.height
                    config.position = min(height, (size.height))
                }).onEnded({ value in
                    withAnimation(.smooth(duration: 0.3)) {
                        config.position = .zero
                        config.progress = .zero
                    }
                })
            )
            .transition(.offset(y: size.height))
    }
    
    func generateProgress() {
        let progress = max(min(config.position / (size.height - 50), 1.0), .zero)
        config.progress = progress
    }
}

//#Preview {
//    MiniPlayerView()
//}
