//
//  SettingsViewModel.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 16.07.2024.
//

import Foundation

@MainActor
final class SettingsViewModel : ObservableObject{
    @Published var goToSignInView : Bool = false
    func logOut() throws {
        try AuthManager.shared.signOut()
        goToSignInView = true
        CacheManager.shared.isUserloggedIn = false
    }
}
