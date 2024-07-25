//
//  DetailViewViewModel.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 24.07.2024.
//

import Foundation
import AVFoundation
import SwiftUI
final class DetailViewViewModel : ObservableObject{
    @Published var wordDetails: [WordDetailModel] = []
    @Published var player: AVAudioPlayer?
    @Published var errorMessage : String? = nil
    
    private let networkManager = NetworkManager()
    private let baseUrl  = "https://api.dictionaryapi.dev/api/v2/entries/en/"
    
    func fetchWordDetail(word:String) async{
        let fullUrlString = "\(baseUrl)\(word)"
        do{
            if let wordDetails : [WordDetailModel] = try await networkManager.fetchResult(url: fullUrlString, headers: nil, parameters: nil, type: [WordDetailModel].self){
                self.wordDetails = wordDetails
            }
        }catch{
            print("Failed to fetch words: \(error)")
        }
    }
    
    func loadAudio(url: String) {
            guard let validURL = URL(string: url) else {
                self.errorMessage = AudioError.invalidURL.localizedDescription
                return
            }
            
            let task = URLSession.shared.dataTask(with: validURL) { data, response, error in
                if let error = error {
                    self.errorMessage = AudioError.dataNotFound.localizedDescription
                    return
                }
                
                guard let data = data else {
                    self.errorMessage = AudioError.audioFileNotFound.localizedDescription
                    return
                }
                
                do {
                    
                        self.player = try? AVAudioPlayer(data: data)
                        self.player?.prepareToPlay()
                        self.player?.play()
                    
                }catch {
                    self.errorMessage = AudioError.audioPlayerCreationFailed.localizedDescription
                }
            }
            
            task.resume()
        }
    
    
}
