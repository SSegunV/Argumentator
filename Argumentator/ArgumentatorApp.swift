//
//  ArgumentatorApp.swift
//  Argumentator
//
//  Created by Segun Sinclair on 30/12/2023.
//

import SwiftUI

@main
struct ArgumentatorApp: App {
    var body: some Scene {
        WindowGroup {
            TimerView(presenter: TimerPresenter())
        }
    }
}
