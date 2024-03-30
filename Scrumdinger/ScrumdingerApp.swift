//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Pranav R on 30/03/24.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
