//
//  MeaningCard.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 25.07.2024.
//

import SwiftUI

struct MeaningCard: View {
    let cardIndex: Int
    @Binding var selectedCardIndex: Int?
    let geometry: GeometryProxy
    let partOfSpeech: String
    let definition: String
    let example: String
    let onExpand: (CGFloat) -> Void
    
    @State private var cardOffset: CGFloat = 0
    
    var body: some View {
        VStack {
            Text(partOfSpeech)
                .foregroundColor(.white)
                .font(.headline)
        }
        .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.15)
        .background(Color.orange)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .onTapGesture {
            withAnimation(.spring()) {
                selectedCardIndex = cardIndex
                onExpand(cardOffset)
            }
        }
        .overlay(
            GeometryReader { geo -> Color in
                let offset = geo.frame(in: .global).minX
                DispatchQueue.main.async {
                    self.cardOffset = offset
                }
                return Color.clear
            }
        )
    }
}

struct ExpandedMeaningCard: View {
    let partOfSpeech: String
    let definition: String
    let example: String
    let geometry: GeometryProxy
    let onClose: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(partOfSpeech)
                .modifier(DisplayLargeBold())
                .foregroundStyle(.white)
            
            Text("Definition: \(definition)")
                .modifier(DisplayNormalRegular())
                .foregroundStyle(.white)
            
            if !example.isEmpty {
                Text("Example: \(example)")
                    .modifier(DisplayNormalRegular())
                    .foregroundStyle(.white)
            }
            
            Button("Close") {
                onClose()
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.estateBlue)
            .clipShape(Capsule())
        }
        .padding()
        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.5)
        .background(Color.orange)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 10)
    }
}
//#Preview {
//    MeaningCard()
//}
