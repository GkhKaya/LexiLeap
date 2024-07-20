//
//  HomeViewViewModel.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 17.07.2024.
//

import Foundation
import Combine

final class HomeViewViewModel: ObservableObject {
    @Published var searchWord = ""
    @Published var selectedLevel: Int = 1
    @Published var translatedWord :String = ""
    @Published var words: [WordModel] = []
//    @Published var translatedWords : TranslationResponse?

    @Published var randomWords: [WordModel] = []

    private let url = "http://api.junic.pro:3000/words"
    private let translateApiUrl = "https://api.mymemory.translated.net/get?q=hello!&langpair=en|tr"

    private let networkManager = NetworkManager()

    func fetchWord() async {
        do {
            if let words: [WordModel] = try await networkManager.fetchResult(url: url, headers: nil, parameters: nil, type: [WordModel].self) {
                self.words = words
                updateRandomWords()
//                translatedWord
      
            }
        } catch {
            print("Failed to fetch words: \(error)")
        }
    }
    
//    func translateWord() async {
//        
//        for index in words.indices {
//            let word = words[index]
//            guard let wordName = word.name else { continue }
//            
//            let translationUrlWithWord = "https://api.mymemory.translated.net/get?q=\(wordName)!&langpair=en|tr"
//            
//            do{
//                if let translatedWords : TranslationResponse  = try await networkManager.fetchResult(url: translationUrlWithWord, headers: nil, parameters: nil, type: TranslationResponse.self){
//                    self.translatedWord = translatedWords.responseData.translatedText
//                    
//                }
//            }catch{
//                print("Failed to fetch translate ofwords : \(error)")
//                
//            }
//            
//        }
//    }
//    
    
   
    
    

    func updateRandomWords() {
        let filteredWords = words.filter { $0.level == selectedLevel }
        randomWords = Array(filteredWords.shuffled().prefix(2))
    }
}