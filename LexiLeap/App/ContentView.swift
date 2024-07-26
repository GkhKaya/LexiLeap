//
//  ContentView.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 11.07.2024.
//

import SwiftUI
import Firebase


struct ContentView: View {    
    @State private var isExpanded = false

        // Verileri bir dizi olarak tanımla
        let items = [
            "bloody", "damned", "great", "intensifier", "just", "marvellous", "marvelous",
            "nice", "wonderful", "clear", "fine", "nice", "pleasant", "sunny", "attractive",
            "beauteous", "cute", "fair", "fit", "good-looking", "gorgeous", "handsome", "hot",
            "lovely", "nice-looking", "pretty", "shapely", "sheen", "excellent", "exceptional",
            "good", "great", "marvellous", "marvelous", "perfect", "stylish", "wonderful"
        ]

        var body: some View {
            ZStack {
                // Arka Plan
                Color.black
                    .edgesIgnoringSafeArea(.all)
                    .opacity(isExpanded ? 0.5 : 1) // Genişletilmiş durumda arka planı şeffaf yapar
                    .onTapGesture {
                        if isExpanded {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                isExpanded = false
                            }
                        }
                    }
                
                if isExpanded {
                    // Genişletilmiş View
                    VStack {
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                                ForEach(items, id: \.self) { item in
                                    Text(item)
                                        .padding(8)
                                        .background(Color.blue.opacity(0.2))
                                        .cornerRadius(8)
                                }
                            }
                            .padding()
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                    .background(Color.white)
                    .transition(.scale)
                    .onTapGesture {
                        // İçerikte tıklama genişletilmiş view'in kapanmasını engeller
                    }
                } else {
                    // Daraltılmış View
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 200, height: 100)
                        .overlay(
                            Text("Adjective")
                                .foregroundColor(.white)
                                .font(.headline)
                        )
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                isExpanded = true
                            }
                        }
                }
            }
        }
    }

#Preview {
    ContentView()
}

