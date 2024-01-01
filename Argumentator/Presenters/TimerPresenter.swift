//
//  TimerPresenter.swift
//  Argumentator
//
//  Created by Segun Sinclair on 30/12/2023.
//

import Foundation
import SwiftUI

class TimerPresenter: ObservableObject {
    @Published var elapsedTime: TimeInterval = 0.0
    @Published var progressCircleTime: TimeInterval = 0.0
    private var timerModel = TimerModel()

    func startButtonPressed() {
        timerModel.resetTimer()
        timerModel.startTimer()
        updateTimer()
    }

    private func updateTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let self = self else { return }

            // Update actual elapsed time
            if let startTime = self.timerModel.startTime {
                self.elapsedTime = Date().timeIntervalSince(startTime)
            } else {
                timer.invalidate()
            }

            // Update progress circle time and reset after 24 hours
            self.progressCircleTime += 1.0
            if self.progressCircleTime >= 24 * 60 * 60 {
                self.progressCircleTime = 0.0
            }
        }
    }
}

func formatTimeInterval(interval: TimeInterval) -> String {
    let formatter = DateComponentsFormatter()
    formatter.unitsStyle = .positional
    formatter.allowedUnits = [.hour, .minute, .second]
    return formatter.string(from: interval) ?? "00:00:00"
}
