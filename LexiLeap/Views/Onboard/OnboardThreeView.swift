//
//  OnboardThreeView.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 13.07.2024.
//

import SwiftUI

struct OnboardThreeView: View {
    @State private var navigationPath = NavigationPath()

    @ObservedObject var viewModel : OnboardViewViewModel
    var body: some View {
        
        NavigationStack(path:$navigationPath) {
            GeometryReader{geometry in
                
                Image(ProjectImages.OnboardScreen.onboard3.rawValue)
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
                
                VStack{
                    ZStack {
                        Rectangle().foregroundStyle(.white).clipShape(RoundedRectangle(cornerRadius: ProjectRadius.normal.rawValue))
                        
                        VStack {
                            //Circle
                            HStack{
                                Circle().foregroundStyle(viewModel.currentStep == 0 ? .estateBlue : .gray)
                                Circle().foregroundStyle(viewModel.currentStep == 1 ? .estateBlue : .gray)
                                Circle().foregroundStyle(viewModel.currentStep == 2 ? .estateBlue : .gray)
                            }.frame(width: geometry.dw(width: 0.15))
                            
                            //Onboard texts
                            OnboardTexts(title: LocaleKeys.OnboardView.createFlashcards.rawValue.locale(), desc: LocaleKeys.OnboardView.createForTheFlashardYouWantAndRepaet.rawValue.locale())
                            
                            //Pass button
                            NavigationLink {
                                Text("sasa")
                            } label: {
                                Text(LocaleKeys.General.login.rawValue.locale())
                                    .modifier(DisplayButtonLarge())
                                    .foregroundStyle(.white)
                                    .padding(.vertical,ProjectPaddings.small.rawValue)
                                    .padding(.horizontal,ProjectPaddings.massive.rawValue)
                                    .background(Color.princetonOrange)
                                    .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.normal.rawValue))
                                    .padding(.top,ProjectPaddings.massive.rawValue)
                                
                            }
                            
                            //Skip button
                            Button(action: {
                                skipToContentView()
                            }) {
                                Text(LocaleKeys.General.skip.rawValue.locale())
                                    .modifier(DisplayButtonSmall())
                                    .foregroundStyle(.princetonOrange)
                                    .padding(.top, ProjectPaddings.normal.rawValue)
                            }

                            
                            Spacer()
                        }.padding(.top,ProjectPaddings.normal.rawValue)
                    }
                }.padding(.top,geometry.dh(height: 0.45))
                    .ignoresSafeArea()
                    .navigationDestination(for: String.self) { value in
                        if value == "ContentView" {
                            ContentView()
                        }
                    }
            }
        }
        
    }
    private func skipToContentView() {
        // Clear the current path and push the new view
        navigationPath.removeLast(navigationPath.count)
        navigationPath.append("ContentView")
    }
}

#Preview {
    OnboardThreeView(viewModel: OnboardViewViewModel())
}
