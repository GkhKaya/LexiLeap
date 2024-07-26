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
    @Published var translatedWord: String = ""
    @Published var goToSettingsView: Bool = false
    @Published var words: [WordModel] = []
    @Published var wordOfDay: WordModel?
    @Published var randomWords: [WordModel] = []
    
    private let url = "http://api.junic.pro:3000/words"
    private let networkManager = NetworkManager()
    
    func fetchWord() async {
        do {
            if let fetchedWords: [WordModel] = try await networkManager.fetchResult(url: url, headers: nil, parameters: nil, type: [WordModel].self) {
                await MainActor.run {
                    self.words = fetchedWords
                    self.updateRandomWords()
                    self.getDailyWord()
                }
            }
        } catch {
            print("Failed to fetch words: \(error)")
        }
    }
    
    func updateRandomWords() {
        let filteredWords = words.filter { $0.level == selectedLevel }
        randomWords = Array(filteredWords.shuffled().prefix(2))
    }
    
    func getDailyWord() {
        guard !words.isEmpty else { return }
        let calendar = Calendar.current
        let dayOfYear = calendar.ordinality(of: .day, in: .year, for: Date()) ?? 0
        let index = dayOfYear % words.count
        wordOfDay = words[index]
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
    
   
    
    

