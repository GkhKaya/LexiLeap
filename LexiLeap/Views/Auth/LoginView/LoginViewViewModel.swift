//
//  LoginViewViewModel.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 14.07.2024.
//

import Foundation

final class LoginViewViewModel : ObservableObject{
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var gotoSignUpView : Bool = false
    @Published var gotoHomeView : Bool = false
    
    func signIn(){
        guard !email.isEmpty,!password.isEmpty else {
            print("No email or password not found")
            return
        }
        
        Task{
            do{
                let returnUserData = try await AuthManager.shared.signIn(email: email, password: password)
                print("Success")
                print(returnUserData)
                gotoHomeView = true
                CacheManager.shared.isUserloggedIn = true
            }catch{
                print("Error: \(error)")
            }
            
        }
    }
}
