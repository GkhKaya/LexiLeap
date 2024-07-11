//
//  FontModifier.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 11.07.2024.
//

import Foundation
import SwiftUI

struct DisplayLargeBlack : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.system(size: 24,weight: .black))
    }
}

struct DisplayLargeBold : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.system(size: 24,weight: .bold))
    }
}

struct DisplayLargeRegular : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.system(size: 24,weight: .regular))
    }
}

struct DisplayMediumBold : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.system(size: 14,weight: .bold))
    }
}

struct DisplayMediumRegular : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.system(size: 14,weight: .regular))
    }
}


struct DisplayButtonLarge : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.system(size: 24,weight: .regular))
    }
}
struct DisplayButtonSmall : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.system(size: 12,weight: .bold))
    }
}



