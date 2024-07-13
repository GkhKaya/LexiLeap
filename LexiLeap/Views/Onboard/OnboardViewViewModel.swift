//
//  OnboardViewViewModel.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 13.07.2024.
//

import Foundation
import SwiftUI

final class OnboardViewViewModel : ObservableObject{
    @Published var showNextView = false
    @Published var currentStep = 0
    
    
    func nextStep() {
        if currentStep < 2 {
            withAnimation {
                currentStep += 1
            }
        }
    }
}
