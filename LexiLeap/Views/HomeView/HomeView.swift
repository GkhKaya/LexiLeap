//
//  HomeView.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 17.07.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm = HomeViewViewModel()

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
                                WordCard(
                                    geometry: geometry,
                                    word: word.name ?? "",
                                    plusAction: {},
                                    seeDetailAction: {},
                                    selectedLevel: word.level
                                    
                                )
                                .padding(.top, ProjectPaddings.extraSmall.rawValue)
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
                        WordCard(
                            geometry: geometry,
                            word: "Hello",
                     
                            plusAction: {},
                            seeDetailAction: {}
                        )

                        HStack {
                            Text(LocaleKeys.HomeView.yourFlashcard.rawValue.locale())
                                .padding(.top, ProjectPaddings.normal.rawValue)
                                .modifier(DisplayNormalBold())
                            Spacer()
                            JustTextButton(action: {}, text: LocaleKeys.General.seeAll.rawValue.locale())
                        }

                        HStack {
                            ZStack {
                                Rectangle()
                                    .frame(width: geometry.dw(width: 0.4), height: geometry.dh(height: 0.21))
                                    .foregroundStyle(Color.orochimaruGray)
                                    .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.normal.rawValue))
                            }
                            Spacer()
                            ZStack {
                                Rectangle()
                                    .frame(width: geometry.dw(width: 0.4), height: geometry.dh(height: 0.21))
                                    .foregroundStyle(Color.orochimaruGray)
                                    .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.normal.rawValue))
                            }
                        }
                    }
                    .padding(.all)
                    .navigationTitle("Homepage")
                    .onAppear {
                        Task {
                            await vm.fetchWord()
                      
                        }
                    }
                }
            }    .background(.cottonBall)
            .searchable(text: $vm.searchWord)
        }
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
