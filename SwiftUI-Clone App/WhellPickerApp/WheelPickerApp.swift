//
//  WheelPickerApp.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/20/24.
//

import SwiftUI

struct WheelPickerApp: View {
    @State private var config: WheelPicker.Config = .init(count: 30,
                                                          steps: 5,
                                                          spacing: 15,
                                                          multiplier: 10)
    @State private var value: CGFloat = 0
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .lastTextBaseline, spacing: 5, content: {
                    let lbs = CGFloat(config.steps) * CGFloat(value)
                    Text(verbatim: "\(value)")
                        .font(.largeTitle.bold())
                        .contentTransition(.numericText(value: value))
                        .animation(.snappy, value: value)
                    
                    Text("lbs")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .textScale(.secondary)
                        .foregroundStyle(.gray)
                })
                WheelPicker(config: config, value: $value)
                    .frame(height: 60)
            }
            .navigationTitle("Wheel Picker")
        }
    }
}

#Preview {
    WheelPickerApp()
}
