//
//  TimerArc.swift
//  Argumentator
//
//  Created by Segun Sinclair on 31/12/2023.
//

import SwiftUI

struct TimerArc: Shape {
    let elapsedTime: TimeInterval
    private let totalDuration: TimeInterval = 24 * 60 * 60  // 24 hours in seconds
    private let updateInterval: TimeInterval = 15 * 60  // 15 minutes in seconds
    
    private var degreesPerInterval: Double {
        360 / (totalDuration / updateInterval)
    }
    
    private var startAngle: Angle {
        Angle(degrees: 0)
    }
    
    private var endAngle: Angle {
        Angle(degrees: degreesPerInterval * elapsedTime / updateInterval)
    }
    
    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}


#Preview {
    TimerArc(elapsedTime: 60)
}
