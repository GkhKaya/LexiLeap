//
//  DetailView.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 24.07.2024.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject private var vm = DetailViewViewModel()
    @State var word : WordModel
    @State private var showAlert = false
    var body: some View {
        NavigationStack{
            GeometryReader{geometry in
                VStack{
                    //                    Text and level
                    HStack{
                        Text(word.name ?? "")
                            .modifier(DisplayLargeBold())
                        Spacer()
                        switch word.level{
                        case 1:
                            Text("A1")
                                .foregroundStyle(.white)
                                .modifier(DisplayNormalBold())
                                .padding(.horizontal,ProjectPaddings.extraLarge.rawValue)
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
                    if let firstDetail = vm.wordDetails.first{
                        HStack {
                            ForEach(firstDetail.phonetics, id:\.text){phonetic in
                                VStack {
                                    Text("Phonetic")
                                    Text(phonetic.text)
                                    
                                    
                                    Button{
                                        vm.loadAudio(url: phonetic.audio)
                                        if vm.errorMessage != nil {
                                            showAlert = true
                                        }
                                    }label:{
                                        HStack{
                                            Image(systemName: "play.fill")
                                        }
                                    }
                                    
                                    
                                    
                                }
                            }
                        }
                    }
                    
                    
                    
                }
                .padding()
                .navigationTitle("Word Detail").navigationBarTitleDisplayMode(.inline)
                .alert(isPresented:$showAlert){
                    Alert(
                        title: Text("Error"),
                    message: Text(vm.errorMessage ?? "Unkown Error"),
                        dismissButton: .default(Text("Ok")){
                            vm.errorMessage = nil
                        }
                    )
                }
            }.background(.cottonBall)
                .onAppear{
                    Task{
                        await vm.fetchWordDetail(word:word.name ?? "beautiful")
                    }
                    
                }
        }
    }
}

#Preview {
    DetailView(word: WordModel(id: 1, name: "Girl", level: 1,createdAt: nil,updatedAt: nil))
}




//if let firstDetail = vm.wordDetails.first{
//    ForEach(firstDetail.meanings, id: \.partOfSpeech){meaning in
//        Text(meaning.partOfSpeech)
//
//    }
//}else{
//    Text("No data")
//}
