//
//  SignUpViewModel.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 15.07.2024.
//

import Foundation

@MainActor
final class SignUpViewModel : ObservableObject{
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var goToSettingsView : Bool = false
    
    func createUser(){
        guard !email.isEmpty,!password.isEmpty else {
            print("No email or password not found")
            return
        }
        
        Task{
            do{
                let returnUserData = try await AuthManager.shared.createUser(email:email,password: password)
                goToSettingsView = true
                CacheManager.shared.isUserloggedIn = true
                print("Success")
                print(returnUserData)
            }catch{
                print("Error: \(error)")
            }
        }
    }
    
}
