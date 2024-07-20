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
                                    translate: "as",
                                    plusAction: {},
                                    seeDetailAction: {}
                                )
                                .padding(.top, ProjectPaddings.normal.rawValue)
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
                            translate: "Merhaba",
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
                    .navigationTitle("Ana Sayfa")
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
     var translate: String
     var plusAction:()->Void
     var seeDetailAction:()->Void
    var body: some View {
        ZStack{
            Rectangle().frame(height: geometry.dh(height: 0.21)).foregroundStyle(Color.white).clipShape(RoundedRectangle(cornerRadius: ProjectRadius.normal.rawValue))
            
            VStack{
                
                HStack(){
                    Spacer()
                    Button {
                        plusAction()
                    }label:{
                        Image(systemName: "plus").foregroundStyle(.black)
                    }
                    
                }.padding(.trailing,ProjectPaddings.small.rawValue)
                    .padding(.top,ProjectPaddings.small.rawValue)
                
                Text(word).modifier(DisplayLargeBold())
                Text(translate).modifier(DisplayNormalRegular())
                    .padding(.top,ProjectPaddings.extraSmall.rawValue)
                
                Button {
                    plusAction()
                }label:{
                    HStack {
                        Spacer()
                        Text("Detayları Gör")
                            .modifier(DisplayButtonSmall())
                        Image(systemName: "chevron.right")
                    }.padding(.trailing,ProjectPaddings.small.rawValue)
                      
                    
                }.tint(.black)
                
                Spacer()
            }
            
        }.frame(height: geometry.dh(height: 0.2))
            
    }
}
