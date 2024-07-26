import Foundation
import AVFoundation
import SwiftUI

final class DetailViewViewModel: ObservableObject {
    @Published var wordDetails: [WordDetailModel] = []
    @Published var player: AVAudioPlayer?
    @Published var errorMessage: String? = nil
    
    private let networkManager = NetworkManager()
    private let baseUrl = "https://api.dictionaryapi.dev/api/v2/entries/en/"
    
    func fetchWordDetail(word: String) async {
        let fullUrlString = "\(baseUrl)\(word)"
        do {
            if let fetchedWordDetails: [WordDetailModel] = try await networkManager.fetchResult(url: fullUrlString, headers: nil, parameters: nil, type: [WordDetailModel].self) {
                await MainActor.run {
                    self.wordDetails = fetchedWordDetails
                }
            }
        } catch {
            print("Failed to fetch word details: \(error)")
            await MainActor.run {
                self.errorMessage = "Failed to fetch word details."
            }
        }
    }
    
    func loadAudio(url: String) async {
        guard let validURL = URL(string: url) else {
            await MainActor.run {
                self.errorMessage = AudioError.invalidURL.localizedDescription
            }
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: validURL)
            
            await MainActor.run {
                do {
                    self.player = try AVAudioPlayer(data: data)
                    self.player?.prepareToPlay()
                    self.player?.play()
                } catch {
                    self.errorMessage = AudioError.audioPlayerCreationFailed.localizedDescription
                }
            }
        } catch {
            await MainActor.run {
                self.errorMessage = AudioError.dataNotFound.localizedDescription
            }
        }
    }
}
