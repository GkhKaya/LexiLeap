//
//  MainOnboardView.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 13.07.2024.
//

import SwiftUI

import SwiftUI

struct MainOnboardView: View {
    @StateObject private var viewModel = OnboardViewViewModel()

    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all) // Arka planı beyaz yaparak tam ekran kaplamasını sağlar
            
            TabView(selection: $viewModel.currentStep) {
                OnboardOneView(viewModel: viewModel)
                    .tag(0)
                OnboardTwoView(viewModel: viewModel)
                    .tag(1)
                OnboardThreeView(viewModel: viewModel)
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }.ignoresSafeArea(.all)
    }
}

#Preview {
    MainOnboardView()
}
