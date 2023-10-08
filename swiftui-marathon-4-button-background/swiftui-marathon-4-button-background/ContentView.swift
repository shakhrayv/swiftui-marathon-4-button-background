//
//  ContentView.swift
//  swiftui-marathon-4-button-background
//
//  Created by Vladislav Shakhray on 08/10/2023.
//

import SwiftUI

struct SkipButtonStyle: PrimitiveButtonStyle {
    var duration: TimeInterval
    var scale: CGFloat
    
    @State private var tapped = false

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Color.secondary.frame(width: 60, height: 60)
                .clipShape(Circle())
                .opacity(tapped ? 0.2 : 0.0)
        
            
            configuration.label
                .foregroundStyle(.blue)
                .scaleEffect(tapped ? scale : 1.0)
        }
        .onTapGesture {
            configuration.trigger()
            withAnimation(.interactiveSpring(duration: duration)) {
                tapped = true
            } completion: {
                tapped = false
            }
        }
        .animation(.bouncy, value: tapped)

    }
}

struct ContentView: View {
    var duration: TimeInterval = 1.0
    var scale: CGFloat = 0.5

    @State var shouldAnimate = false
    
    var body: some View {
        Button {
            if !shouldAnimate {
                withAnimation(.interpolatingSpring(stiffness: 150, damping: 15)) {
                    shouldAnimate = true
                } completion: {
                    shouldAnimate = false
                }
            }
        } label: {
            HStack(spacing: 0.0) {
                Image(systemName: "arrowtriangle.right.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: shouldAnimate ? 20.0 : 0.0)
                Image(systemName: "arrowtriangle.right.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 20.0)
                Image(systemName: "arrowtriangle.right.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: shouldAnimate ? 0.0 : 20.0)
            }
            .frame(maxWidth: 40.0)
        }
        .buttonStyle(SkipButtonStyle(duration: duration, scale: scale))
    }
}

#Preview {
    ContentView(duration: 0.11, scale: 0.86)
}
