//
//  EnvironmentVariables.swift
//  lidar
//
//  Created by Ryan Romanchuk on 6/23/22.
//

import Foundation

import Metal

class EnvironmentVariables {
    static let shared: EnvironmentVariables = {
       let instance = EnvironmentVariables()
        return instance
    }()
    let metalDevice: MTLDevice
    let metalCommandQueue: MTLCommandQueue
    let metalLibrary: MTLLibrary
    private init() {
        guard let metalDevice = MTLCreateSystemDefaultDevice() else {
            fatalError("Error creating metal device")
        }
        guard let metalCommandQueue = metalDevice.makeCommandQueue() else {
            fatalError("Error creating command queue")
        }
        guard let metalLibrary = metalDevice.makeDefaultLibrary() else {
            fatalError("Error creating default library")
        }
        self.metalDevice = metalDevice
        self.metalCommandQueue = metalCommandQueue
        self.metalLibrary = metalLibrary
    }
}

