//
//  StretchSliderApp.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/21/24.
//

import SwiftUI

struct StretchSliderApp: View {
    @State private var progress: CGFloat = .zero
    @State private var axis: CustomSlider.SliderAxix = .vertical
    var body: some View {
        NavigationStack {
            VStack {
                Picker("", selection: $axis) {
                    Text("Vertical")
                        .tag(CustomSlider.SliderAxix.vertical)
                    
                    Text("Horizontal")
                        .tag(CustomSlider.SliderAxix.horizontal)
                }
                .pickerStyle(.segmented)
                
                CustomSlider(
                    sliderProgress: $progress,
                    symbol: .init(
                        icon: "airpodspro",
                        tint: .gray,
                        font: .system(
                            size: 25
                        ),
                        padding: 20,
                        display: axis == .vertical,
                        alignment: .bottom
                    ),
                    axis: axis,
                    tint: .white
                )
                .frame(width: axis == .horizontal ? 220 : 60,
                       height: axis == .horizontal ? 30 : 180)
                .frame(maxHeight: .infinity)
                .animation(.snappy, value: axis)
                
                Button("Update") {
                    progress = 0.2
                }
            }
            .padding()
            .frame(maxWidth: .infinity,
                   alignment: .top)
            .navigationTitle("Stretchy Slider")
            .background(.fill)
        }
    }
}

#Preview {
    StretchSliderApp()
}
