//
//  Buttons.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 15.07.2024.
//

import Foundation
import SwiftUI
struct TextButtonWithBg: View {
    var action: () -> Void //
    var text : LocalizedStringKey
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(text)
                .modifier(DisplayButtonLarge())
                .foregroundStyle(.white)
                .padding(.vertical, ProjectPaddings.small.rawValue)
                .padding(.horizontal, ProjectPaddings.massive.rawValue)
                .background(Color.princetonOrange)
                .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.normal.rawValue))
                .padding(.top, ProjectPaddings.massive.rawValue)
        }
    }
}

struct JustTextButton : View {
    var action: () -> Void //
    var text : LocalizedStringKey
    var body: some View {
        Button{
            action()
        }label: {
 
                Text(text)
                    .foregroundStyle(.princetonOrange)
                    .modifier(DisplayButtonSmall())
                
            }.padding(.top,ProjectPaddings.extraSmall.rawValue)
        }
    }

