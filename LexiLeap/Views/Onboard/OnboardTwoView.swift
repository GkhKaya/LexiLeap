//
//  OnboardTwoView.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 13.07.2024.
//

import SwiftUI

struct OnboardTwoView: View {
    @ObservedObject var viewModel: OnboardViewViewModel
    @State private var navigationPath = NavigationPath()
    
    
    var body: some View {
        NavigationStack(path:$navigationPath) {
            GeometryReader { geometry in
                ZStack {
                    Image(ProjectImages.OnboardScreen.onboard2.rawValue)
                        .resizable()
                        .scaledToFit()
                        .ignoresSafeArea()
                    
                    VStack {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.normal.rawValue))
                            
                            VStack {
                                HStack {
                                    Circle().foregroundStyle(viewModel.currentStep == 0 ? .estateBlue : .gray)
                                    Circle().foregroundStyle(viewModel.currentStep == 1 ? .estateBlue : .gray)
                                    Circle().foregroundStyle(viewModel.currentStep == 2 ? .estateBlue : .gray)
                                }
                                .frame(width: geometry.dw(width: 0.15))
                                
                                OnboardTexts(
                                    title: LocaleKeys.OnboardView.wideVocabBank.rawValue.locale(),
                                    desc: LocaleKeys.OnboardView.searchForTheWordYouWantLearnAllDetail.rawValue.locale()
                                )
                                
                                Button(action: {
                                    viewModel.nextStep()
                                }) {
                                    Text(LocaleKeys.General.pass.rawValue.locale())
                                        .modifier(DisplayButtonLarge())
                                        .foregroundStyle(.white)
                                        .padding(.vertical, ProjectPaddings.small.rawValue)
                                        .padding(.horizontal, ProjectPaddings.massive.rawValue)
                                        .background(Color.princetonOrange)
                                        .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.normal.rawValue))
                                        .padding(.top, ProjectPaddings.massive.rawValue)
                                }
                                
                                // Skip button
                                Button(action: {
                                    skipToContentView()
                                }) {
                                    Text(LocaleKeys.General.skip.rawValue.locale())
                                        .modifier(DisplayButtonSmall())
                                        .foregroundStyle(.princetonOrange)
                                        .padding(.top, ProjectPaddings.normal.rawValue)
                                }
                                
                                Spacer()
                            }
                            .padding(.top, ProjectPaddings.normal.rawValue)
                        }
                    }
                    .padding(.top, geometry.dh(height: 0.45))
                    .ignoresSafeArea()
                    .navigationDestination(for: String.self) { value in
                        if value == "ContentView" {
                            ContentView()
                        }
                    }
                }
            }.ignoresSafeArea(.all)
        }
    }
    private func skipToContentView() {
        // Clear the current path and push the new view
        navigationPath.removeLast(navigationPath.count)
        navigationPath.append("ContentView")
    }
}

#Preview {
    OnboardTwoView(viewModel: OnboardViewViewModel())
}
