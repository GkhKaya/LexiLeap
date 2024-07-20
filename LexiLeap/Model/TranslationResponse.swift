//
//  TranslationResponse.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 20.07.2024.
//

import Foundation

// Ana yanıt modeli
struct TranslationResponse: Codable {
    let responseData: ResponseData
    let quotaFinished: Bool
    let mtLangSupported: String?
    let responseDetails: String
    let responseStatus: Int
    let responderId: String?
    let exceptionCode: String?
    let matches: [Match]

    // İç içe model: responseData
    struct ResponseData: Codable {
        let translatedText: String
        let match: Double
    }

    // İç içe model: matches
    struct Match: Codable {
        let id: String
        let segment: String
        let translation: String
        let source: String
        let target: String
        let quality: Int
        let reference: String?
        let usageCount: Int
        let subject: String
        let createdBy: String
        let lastUpdatedBy: String
        let createDate: String
        let lastUpdateDate: String
        let match: Double

        // JSON'daki anahtarları Swift standartlarına uyacak şekilde düzenleyin
        private enum CodingKeys: String, CodingKey {
            case id
            case segment
            case translation
            case source
            case target
            case quality
            case reference
            case usageCount = "usage-count"
            case subject
            case createdBy = "created-by"
            case lastUpdatedBy = "last-updated-by"
            case createDate = "create-date"
            case lastUpdateDate = "last-update-date"
            case match
        }
    }
}
