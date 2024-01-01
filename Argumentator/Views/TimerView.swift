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
            TimerArc(elapsedTime: presenter.elapsedTime)
                .stroke(style: StrokeStyle(lineWidth: 24, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.blue)
                .rotationEffect(Angle(degrees: -90))
                .overlay(
                    Text(formatTimeInterval(interval: presenter.elapsedTime))
                )
                .padding()

            Button("Start", action: presenter.startButtonPressed)
                .foregroundColor(.blue)
                .padding()
        }
    }
}

#Preview {
    TimerView(presenter: TimerPresenter())
}
