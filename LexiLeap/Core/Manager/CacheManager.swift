//
//  CacheManager.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 16.07.2024.
//

import Foundation

final class CacheManager{
    static let shared = CacheManager()
    
    private init(){}
    
    private let userDefaults = UserDefaults.standard
    private let userLoggedInKey = "userLoggedIn"
    
    var isUserloggedIn : Bool {
        get{
            return userDefaults.bool(forKey: userLoggedInKey)
        }
        set{
            userDefaults.set(newValue, forKey: userLoggedInKey)
        }
    }
    
    func clearUserSession(){
        userDefaults.removeObject(forKey: userLoggedInKey)
    }
}
