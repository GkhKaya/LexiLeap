//
//  HomeViewViewModel.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 17.07.2024.
//

import Foundation
final class HomeViewViewModel : ObservableObject{
    @Published var searchWord = ""
    @Published var selectedLevel : Int = 1
}
