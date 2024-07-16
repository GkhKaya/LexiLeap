//
//  SettingsViewModel.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 16.07.2024.
//

import Foundation

@MainActor
final class SettingsViewModel : ObservableObject{
    func logOut() throws {
        try AuthManager.shared.signOut()
    }
}
