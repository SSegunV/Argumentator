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
    private var timerModel = TimerModel()

    func startButtonPressed() {
        timerModel.resetTimer()
        timerModel.startTimer()
        updateTimer()
    }

    private func updateTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            if let startTime = self.timerModel.startTime {
                self.elapsedTime = Date().timeIntervalSince(startTime)
            } else {
                timer.invalidate()
            }
        }
    }
}

