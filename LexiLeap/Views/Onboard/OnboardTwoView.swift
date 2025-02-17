//
//  OnboardTwoView.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 13.07.2024.
//

import SwiftUI

struct OnboardTwoView: View {
    @ObservedObject var viewModel: OnboardViewViewModel
    
    
    var body: some View {
        NavigationStack() {
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
                                
                                TextButtonWithBg(action:{viewModel.nextStep()},text: LocaleKeys.General.pass.rawValue.locale())
                                
                                NavigationLink {
                                    LoginView()
                                } label: {
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
                    
                }
            }.ignoresSafeArea(.all)
        }
    }
   
}

#Preview {
    OnboardTwoView(viewModel: OnboardViewViewModel())
}
