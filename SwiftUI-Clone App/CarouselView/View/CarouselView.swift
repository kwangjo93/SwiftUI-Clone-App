//
//  CarouselView.swift
//  SwiftUI-Clone App
//
//  Created by 천광조 on 3/30/24.
//

import SwiftUI

struct CarouselView: View {
    var xDistance: Int = 100
    @State private var snappedItem = 0.0
    @State private var draggingItem = 1.0
    @State private var activeIndex: Int = 0
    
    var views: [CarouselViewChild] = placeholdercarouselChildView
    
    var body: some View {
        ZStack {
            ForEach(views) { view in
                view
                    .scaleEffect(1.0 - abs(distance(view.id)) * 0.2)
                    .opacity(1.0 - abs(distance(view.id)) * 0.3)
                    .offset(x: getOffset(view.id), y: 0)
                    .zIndex(1.0 - abs(distance(view.id)) * 0.1)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    draggingItem = snappedItem + value.translation.width / 100
                }
                .onEnded { value in
                    withAnimation {
                        draggingItem = snappedItem + value.predictedEndTranslation.width / 100
                        draggingItem = round(draggingItem).remainder(dividingBy: Double(views.count))
                        snappedItem = draggingItem
                        self.activeIndex = views.count + Int(draggingItem)
                        if self.activeIndex > views.count ||
                            Int(draggingItem) >= 0 {
                            self.activeIndex = Int(draggingItem)
                        }
                    }
                }
        )
    }
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item).remainder(dividingBy: Double(views.count)))
    }
    
    func getOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(views.count) * distance(item)
        return sin(angle) * Double(xDistance)
    }
}

#Preview {
    CarouselView()
}

var placeholdercarouselChildView: [CarouselViewChild] = [
    CarouselViewChild(id: 1, content: {
        ZStack(content: {
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.red)
            Text("1")
                .padding()
        })
        .frame(width: 200, height: 400)
    }),
    
    CarouselViewChild(id: 2, content: {
        ZStack(content: {
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.blue)
            Text("2")
                .padding()
        })
        .frame(width: 200, height: 400)
    }),
    
    CarouselViewChild(id: 3, content: {
        ZStack(content: {
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.brown)
            Text("3")
                .padding()
        })
        .frame(width: 200, height: 400)
    }),
    
    CarouselViewChild(id: 4, content: {
        ZStack(content: {
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.yellow)
            Text("4")
                .padding()
        })
        .frame(width: 200, height: 400)
    })

]
