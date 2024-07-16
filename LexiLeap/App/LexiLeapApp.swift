//
//  LexiLeapApp.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 11.07.2024.
//

import SwiftUI
import Firebase

@main
struct LexiLeapApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    init(){
        UITraitCollection.current = UITraitCollection(userInterfaceStyle: .light)
    }
    var body: some Scene {
        WindowGroup {
          RootView()
                .environment(\.colorScheme,.light)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
