//
//  SignUpViewModel.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 15.07.2024.
//

import Foundation

final class SignUpViewModel : ObservableObject{
    @Published var email : String = ""
    @Published var password : String = ""
    
}
