//
//  LocaleKeys.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 11.07.2024.
//

import Foundation
import SwiftUI
struct LocaleKeys {
    
    enum General : String{
        case pass  = "pass"
        case skip  = "skip"
        case login  = "login"
        case register  = "register"
        case email  = "email"
        case password  = "password"
        case or  = "or"
    }
    
    enum OnboardView : String{
        case welcomeLexileap = "welcomeLexileap"
        case workWithWordListedByLevel = "workWithWordListedByLevel"
        case searchForTheWordYouWantLearnAllDetail = "searchForTheWordYouWantLearnAllDetail"
        case createFlashcards = "createFlashcards"
        case createForTheFlashardYouWantAndRepaet = "createForTheFlashardYouWantAndRepaet"
        case wideVocabBank = "wideVocabBank"
    }
    
    enum AuthView : String{
        case welconeLoginText = "welconeLoginText"
        case welconeSignUpText = "welconeSignUpText"
        case exampleMail = "exampleMail"
        case forgotPassword = "forgotPassword"
        case signInWithGoogle = "signInWithGoogle"
        case signUpWithGoogle = "signUpWithGoogle"
        case signInWithApple = "signInWithApple"
        case signUpWithApple = "signUpWithApple"
    }
}

extension String{
    /// It localize any string from Localizable string
    /// - Returns: localized value
    func locale() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
}
