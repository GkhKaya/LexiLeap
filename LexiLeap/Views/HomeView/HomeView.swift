//
//  HomeView.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 17.07.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm = HomeViewViewModel()
    @State private var selectedWord: WordModel? = nil // Tıklanan kelimeyi saklamak için
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        // Level buttons
                        HStack {
                            Spacer()
                            ForEach(1..<7) { index in
                                FilterLevelComponents(
                                    action: {
                                        vm.selectedLevel = index
                                        vm.updateRandomWords()
                                    },
                                    geometry: geometry,
                                    index: index,
                                    selectedLevel: vm.selectedLevel
                                )
                            }
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            JustTextButton(action: {}, text: LocaleKeys.General.seeAll.rawValue.locale())
                        }
                        .padding(.top, ProjectPaddings.normal.rawValue)
                        
                        VStack {
                            ForEach(vm.randomWords) { word in
                                Button {
                                    selectedWord = word // Tıklanan kelimeyi sakla
                                } label: {
                                    WordCard(
                                        geometry: geometry,
                                        word: word.name ?? "",
                                        plusAction: {},
                                        seeDetailAction: {},
                                        selectedLevel: word.level
                                    )
                                    .padding(.top, ProjectPaddings.extraSmall.rawValue)
                                }
                                .tint(.black)
                            }
                        }
                        
                        // Word of the day title
                        HStack {
                            Text(LocaleKeys.HomeView.wordOfTheDay.rawValue.locale())
                                .modifier(DisplayNormalBold())
                            Spacer()
                        }
                        .padding(.top, ProjectPaddings.normal.rawValue)
                        
                        // Word of the day card
                        Button{
                            selectedWord = vm.wordOfDay
                        }label:{
                            WordCard(
                                geometry: geometry,
                                word: vm.wordOfDay?.name ?? "",
                                plusAction: {},
                                seeDetailAction: {},
                                selectedLevel: vm.wordOfDay?.level ?? 1
                            )
                        }.tint(.black)
                        
                        
//                        HStack {
//                            Text(LocaleKeys.HomeView.yourFlashcard.rawValue.locale())
//                                .padding(.top, ProjectPaddings.normal.rawValue)
//                                .modifier(DisplayNormalBold())
//                            Spacer()
//                            JustTextButton(action: {}, text: LocaleKeys.General.seeAll.rawValue.locale())
//                        }
                        
//                        HStack {
//                            ZStack {
//                                Rectangle()
//                                    .frame(width: geometry.dw(width: 0.4), height: geometry.dh(height: 0.21))
//                                    .foregroundStyle(Color.orochimaruGray)
//                                    .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.normal.rawValue))
//                            }
//                            Spacer()
//                            ZStack {
//                                Rectangle()
//                                    .frame(width: geometry.dw(width: 0.4), height: geometry.dh(height: 0.21))
//                                    .foregroundStyle(Color.orochimaruGray)
//                                    .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.normal.rawValue))
//                            }
//                        }
                    }
                    .padding(.all)
                    .navigationTitle("Homepage")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                vm.goToSettingsView = true
                            } label: {
                                Image(systemName: "gearshape")
                            }
                            .tint(.black)
                        }
                    }
                }
                .navigationDestination(isPresented: $vm.goToSettingsView) {
                    SettingsView()}
                .navigationDestination(isPresented: Binding(
                    get: { selectedWord != nil },
                    set: { if !$0 { selectedWord = nil } }
                )) {
                    if let word = selectedWord {
                        DetailView(wordName: word.name ?? "deneme", wordLevel: word.level ?? 1)
                    }
                }
                .onAppear {
                    Task {
                        await vm.fetchWord()
                    }
                }
            }
            .background(.cottonBall)
        }
        .searchable(text: $vm.searchWord)
    }
}


#Preview {
    HomeView()
}

struct WordCard: View {
    var geometry : GeometryProxy
    var word : String
    var plusAction:()->Void
    var seeDetailAction:()->Void
    var selectedLevel : Int?
    var levelImage : String?
    var body: some View {
        ZStack{
            Rectangle().frame(height: geometry.dh(height: 0.17)).foregroundStyle(Color.white).clipShape(RoundedRectangle(cornerRadius: ProjectRadius.normal.rawValue))
            
            VStack(){
                
                Spacer()
                HStack {
                    Image(getLevelImage(for: selectedLevel))
                        .resizable()
                        .frame(width: geometry.dw(width: 0.12),height: geometry.dh(height: 0.06))
                        .padding(.trailing,ProjectPaddings.small.rawValue)
                    
                    Divider()
                        .background(Color.cottonBall)
                    
                    Text(word)
                        .modifier(DisplayLargeBold())
                        .padding(.leading,ProjectPaddings.small.rawValue)
                    Spacer()
                    Image(systemName: "chevron.right")
                }.padding(.horizontal,ProjectPaddings.extraLarge.rawValue)
                Spacer()
            }.frame(height: geometry.dh(height: 0.2))
            
        }
    }
    
    func getLevelImage(for level: Int?) -> String {
        switch level {
        case 1:
            return ProjectImages.LevelLogo.a1Logo.rawValue
        case 2:
            return ProjectImages.LevelLogo.a2Logo.rawValue
        case 3:
            return ProjectImages.LevelLogo.b1Logo.rawValue
        case 4:
            return ProjectImages.LevelLogo.b2Logo.rawValue
        case 5:
            return ProjectImages.LevelLogo.c1Logo.rawValue
        case 6:
            return ProjectImages.LevelLogo.c2Logo.rawValue
        default:
            return "" // Varsayılan logo
        }
    }
}
