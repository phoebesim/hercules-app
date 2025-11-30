//
//  MotionManager.swift
//  HerculesApp
//
//  Created by Phoebe Sim on 15/11/25.
//

import CoreMotion
import Combine

class MotionDetector: ObservableObject {
    private let manager = CMMotionManager()
    @Published var stepDetected = false
    
    private let threshold: Double = 1.10 

    init() {
        start()
    }
    
    func start() {
        guard manager.isAccelerometerAvailable else {
            print ("not available")
            return
        }
        
        manager.accelerometerUpdateInterval = 0.1
        manager.startAccelerometerUpdates(to: .main) { [weak self] data, error in
            guard let self, let accel = data?.acceleration else { return }
            
            let magnitude = abs(accel.x) + abs (accel.y) + abs (accel.z)
            
            if magnitude > self.threshold {
                self.stepDetected = true
            } else {
                self.stepDetected = false
            }
        }
    }
}

