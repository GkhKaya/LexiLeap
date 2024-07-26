//
//  DetailView.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 24.07.2024.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject private var vm = DetailViewViewModel()
    @State var wordName: String
    @State var wordLevel: Int
    @State private var showAlert = false
    @State private var selectedCardIndex: Int? = nil
    @State private var selectedCardOffset: CGFloat = 0
    @State private var scrollViewProxy: ScrollViewProxy? = nil
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack {
                    VStack {
                        // Text and level
                        HStack {
                            Text(wordName)
                                .modifier(DisplayLargeBold())
                            Spacer()
                            switch wordLevel {
                            case 1:
                                Text("A1")
                                    .foregroundStyle(.white)
                                    .modifier(DisplayNormalBold())
                                    .padding(.horizontal, ProjectPaddings.extraLarge.rawValue)
                                    .background(.estateBlue)
                                    .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.normal.rawValue))
                            case 2:
                                Text("A2")
                            case 3:
                                Text("B1")
                            case 4:
                                Text("B2")
                            case 5:
                                Text("C1")
                            case 6:
                                Text("C2")
                            default:
                                Text("A1")
                            }
                        }
                        
                        // Phonetic part
                        if let firstDetail = vm.wordDetails.first {
                            HStack(spacing: geometry.size.width * 0.1) {
                                ForEach(firstDetail.phonetics, id: \.text) { phonetic in
                                    VStack {
                                        Text("Phonetic")
                                        
                                        Text(phonetic.text)
                                            .padding(.top, ProjectPaddings.extraSmall.rawValue)
                                        
                                        Button {
                                            Task {
                                                await vm.loadAudio(url: phonetic.audio)
                                                if vm.errorMessage != nil {
                                                    showAlert = true
                                                }
                                            }
                                        } label: {
                                            HStack {
                                                Image(systemName: "play.fill")
                                            }
                                        }
                                        .padding(.top, ProjectPaddings.extraSmall.rawValue)
                                    }
                                    .padding(.top, ProjectPaddings.normal.rawValue)
                                }
                            }
                        }
                    }
                    .padding()
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            selectedCardIndex = nil
                        }
                    }
                    .opacity(selectedCardIndex != nil ? 0.5 : 1)
                    
                    ZStack {
                        Rectangle()
                            .ignoresSafeArea()
                            .foregroundStyle(.white)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    selectedCardIndex = nil
                                }
                            }
                            .opacity(selectedCardIndex != nil ? 0.5 : 1)
                        
                        VStack {
                            // Meanings part
                            HStack {
                                Text("Meanings")
                                    .modifier(DisplayNormalBold())
                                Spacer()
                            }
                            .opacity(selectedCardIndex != nil ? 0.5 : 1)
                            
                            // Meanings cards
                            ScrollViewReader { proxy in
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 10) {
                                        if let firstDetail = vm.wordDetails.first {
                                            ForEach(Array(firstDetail.meanings.enumerated()), id: \.offset) { meaningIndex, meaning in
                                                ForEach(Array(meaning.definitions.enumerated()), id: \.offset) { defIndex, definition in
                                                    let cardIndex = meaningIndex * 1000 + defIndex
                                                    
                                                    MeaningCard(
                                                        cardIndex: cardIndex,
                                                        selectedCardIndex: $selectedCardIndex,
                                                        geometry: geometry,
                                                        partOfSpeech: meaning.partOfSpeech,
                                                        definition: definition.definition,
                                                        example: definition.example ?? "",
                                                        onExpand: { offset in
                                                            selectedCardOffset = offset
                                                            withAnimation {
                                                                proxy.scrollTo(cardIndex, anchor: .center)
                                                            }
                                                        }
                                                    )
                                                    .id(cardIndex)
                                                }
                                            }
                                        }
                                    }
                                    .padding()
                                }
                                .onAppear {
                                    scrollViewProxy = proxy
                                }
                            }
                            
                            Spacer()
                        }
                        .padding()
                        
                        if let selectedIndex = selectedCardIndex,
                           let firstDetail = vm.wordDetails.first {
                            let meaningIndex = selectedIndex / 1000
                            let defIndex = selectedIndex % 1000
                            if meaningIndex < firstDetail.meanings.count,
                               defIndex < firstDetail.meanings[meaningIndex].definitions.count {
                                let meaning = firstDetail.meanings[meaningIndex]
                                let definition = meaning.definitions[defIndex]
                                ExpandedMeaningCard(
                                    partOfSpeech: meaning.partOfSpeech,
                                    definition: definition.definition,
                                    example: definition.example ?? "",
                                    geometry: geometry,
                                    onClose: {
                                        withAnimation {
                                            selectedCardIndex = nil
                                        }
                                    }
                                )
                                .transition(.scale)
                            }
                        }
                    }
                }
                .navigationTitle("Word Detail")
                .navigationBarTitleDisplayMode(.inline)
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Error"),
                        message: Text(vm.errorMessage ?? "Unknown Error"),
                        dismissButton: .default(Text("Ok")) {
                            vm.errorMessage = nil
                        }
                    )
                }
            }
            .background(.cottonBall)
            .onAppear {
                Task {
                    await vm.fetchWordDetail(word: wordName)
                }
            }
        }
    }
}


#Preview {
    DetailView(wordName: "Girl", wordLevel: 1)
}




//if let firstDetail = vm.wordDetails.first{
//    ForEach(firstDetail.meanings, id: \.partOfSpeech){meaning in
//        Text(meaning.partOfSpeech)
//
//    }
//}else{
//    Text("No data")
//}
