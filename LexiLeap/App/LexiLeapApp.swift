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
          DetailView(word: WordModel(id: 1, name: "girl", level: 1, createdAt: nil, updatedAt: nil))
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
