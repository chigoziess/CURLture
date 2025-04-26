//
//  CURLtureApp.swift
//  CURLture
//
//  Created by Chigozie Sumani on 4/22/25.
//

import SwiftUI
import SwiftData

@main
struct CURLtureApp: App {
    var body: some Scene {
        WindowGroup {
            ListView()
                .modelContainer(for: HairProfile.self)
        }
    }
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
