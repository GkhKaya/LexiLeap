//
//  ProjectErrors.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 25.07.2024.
//

import Foundation


enum AudioError : Error{
    case invalidURL
    case dataNotFound
    case audioPlayerCreationFailed
    case audioFileNotFound
 
    
    var localizedDescription: String {
            switch self {
            case .invalidURL:
                return "Invalid Url"
            case .dataNotFound:
                return "Audio data is not found"
            case .audioPlayerCreationFailed:
                return "Audio Player Creation Failed"
            case .audioFileNotFound:
                return "Audio file is not found"
            }
        }

    
}
