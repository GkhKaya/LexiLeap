//
//  AuthDataResultModel.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 16.07.2024.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel{
    let uid : String
    let email: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
    }
}
