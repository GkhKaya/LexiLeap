// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let wordModel = try? JSONDecoder().decode(WordModel.self, from: jsonData)

import Foundation

// MARK: - WordModelElement
struct WordModel: Codable, Identifiable {
    let id: Int?
    let name: String?
    let level: Int?
    let createdAt, updatedAt: String?
}


