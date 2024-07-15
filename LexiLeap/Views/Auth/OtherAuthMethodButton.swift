//
//  OtherAuthMethodButton.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 15.07.2024.
//

import SwiftUI

struct OtherAuthMethodButton: View {
    var action: () -> Void
    var icon : String
    var text: LocalizedStringKey
    var body: some View {
        Button{
            action()
        }label: {
            Image(icon)
                .padding(.trailing,ProjectPaddings.normal.rawValue)
                .padding(.leading,ProjectPaddings.normal.rawValue)
            Text(text)
                .foregroundStyle(.white)
                .modifier(DisplayMediumBold())
        }
    }
}


