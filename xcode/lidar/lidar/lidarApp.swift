//
//  lidarApp.swift
//  lidar
//
//  Created by Ryan Romanchuk on 6/23/22.
//

import SwiftUI

@main
struct lidarApp: App {
    var body: some Scene {
        WindowGroup {
            MetalDepthView()
        }
    }
}
