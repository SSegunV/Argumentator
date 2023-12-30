//
//  ContentView.swift
//  Argumentator
//
//  Created by Segun Sinclair on 30/12/2023.
//

import SwiftUI

struct TimerView: View {
    @ObservedObject var presenter: TimerPresenter

        var body: some View {
            VStack {
                Text(formatTimeInterval(interval: presenter.elapsedTime))
                    .font(.system(size: 24))
                    .padding()

                Button("Start", action: presenter.startButtonPressed)
                    .foregroundColor(.blue)
                    .padding()
                
                
            }
        }

        private func formatTimeInterval(interval: TimeInterval) -> String {
            let formatter = DateComponentsFormatter()
            formatter.unitsStyle = .positional
            formatter.allowedUnits = [.hour, .minute, .second]
            return formatter.string(from: interval) ?? "00:00:00"
        }
    }


#Preview {
    TimerView(presenter: TimerPresenter())
}
