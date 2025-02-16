//
//  Day60ChallengeApp.swift
//  Day60Challenge
//
//  Created by Даниил Сивожелезов on 18.10.2024.
//

import SwiftData
import SwiftUI

@main
struct Day60ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
