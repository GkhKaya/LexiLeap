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
}
