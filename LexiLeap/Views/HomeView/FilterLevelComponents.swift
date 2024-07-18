//
//  FilterLevelComponents.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 17.07.2024.
//

import SwiftUI

struct FilterLevelComponents: View {
    var action: () -> Void
    var geometry : GeometryProxy
    var index : Int
    var selectedLevel : Int
    var title: String {
        switch index {
        case 1: return "A1"
        case 2: return "A2"
        case 3: return "B1"
        case 4: return "B2"
        case 5: return "C1"
        case 6: return "C2"
        default: return ""
        }
    }
    var body: some View {
        Button{
            action()
        } label:{
            ZStack {
                Rectangle().frame(width: geometry.dw(width: 0.13),height: geometry.dh(height: 0.05)).clipShape(RoundedRectangle(cornerRadius: ProjectRadius.extraSmall.rawValue)).foregroundStyle(index == selectedLevel ? .estateBlue : .princetonOrange)
                
               
                    
                Text(title).foregroundStyle(.white).modifier(DisplayButtonSmall())
            }
        }
    }
}

//#Preview {
//    FilterLevelComponents()
//}
