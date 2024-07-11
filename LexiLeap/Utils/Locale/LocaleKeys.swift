//
//  LocaleKeys.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 11.07.2024.
//

import Foundation
import SwiftUI
struct LocaleKeys {
    
}

extension String{
    /// It localize any string from Localizable string
    /// - Returns: localized value
    func locale() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
}
