//
//  LexiLeapApp.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 11.07.2024.
//

import SwiftUI

@main
struct LexiLeapApp: App {
    init(){
        UITraitCollection.current = UITraitCollection(userInterfaceStyle: .light)
    }
    var body: some Scene {
        WindowGroup {
            MainOnboardView()
                .environment(\.colorScheme,.light)
        }
    }
}
