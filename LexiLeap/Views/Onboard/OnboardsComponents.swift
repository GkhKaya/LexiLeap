//
//  OnboardsComponents.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 13.07.2024.
//

import Foundation
import SwiftUI
struct OnboardTexts: View {
    var title : LocalizedStringKey
    var desc : LocalizedStringKey
    var body: some View {
        VStack {
            Text(title)
                .modifier(DisplayLargeBold())
                .padding(.top,ProjectPaddings.massive.rawValue)
            
            Text(desc)
                .modifier(DisplayMediumRegular())
                .padding(.top,ProjectPaddings.massive.rawValue)
        }
    }
}

