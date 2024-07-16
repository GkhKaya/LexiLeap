//
//  AuthManager.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 15.07.2024.
//

import Foundation
import FirebaseAuth



final class AuthManager{
    static let shared = AuthManager()
    private init(){}
    
    func getAuthedUser() throws -> AuthDataResultModel{
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        return AuthDataResultModel(user: user)
    }
    
    func createUser(email:String, password:String) async throws -> AuthDataResultModel {
        let authDataResult  = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}
