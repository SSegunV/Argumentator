//
//  TimerModel.swift
//  Argumentator
//
//  Created by Segun Sinclair on 30/12/2023.
//

import Foundation
import SwiftUI

class TimerModel: ObservableObject {
    @Published var startTime: Date?

    func startTimer() {
        startTime = Date()
    }

    func resetTimer() {
        startTime = nil
    }
}
