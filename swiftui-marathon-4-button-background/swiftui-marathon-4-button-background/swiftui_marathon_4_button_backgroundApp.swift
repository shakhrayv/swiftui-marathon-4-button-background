//
//  swiftui_marathon_4_button_backgroundApp.swift
//  swiftui-marathon-4-button-background
//
//  Created by Vladislav Shakhray on 08/10/2023.
//

import SwiftUI

@main
struct swiftui_marathon_4_button_backgroundApp: App {
    var body: some Scene {
        WindowGroup {
            HStack(spacing: 20.0) {
                VStack {
                    ContentView(duration: 0.4, scale: 0.0)
                    Group {
                        Text("Duration: 0.4")
                        Text("Scale: 0.0")
                    }
                    .foregroundStyle(.pink)
                }
                VStack {
                    ContentView(duration: 0.11, scale: 0.86)
                    Group {
                        Text("Duration: 0.22")
                        Text("Scale: 0.86")
                    }
                    .foregroundStyle(.blue)

                }
            }
        }
    }
}
