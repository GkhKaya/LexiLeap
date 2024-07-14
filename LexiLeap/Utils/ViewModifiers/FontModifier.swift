//
//  FontModifier.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 11.07.2024.
//

import Foundation
import SwiftUI


struct DisplayExtraLargeBold : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.system(size: 30,weight: .bold))
    }
}

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

struct DisplayNormalBold : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.system(size: 18,weight: .bold))
    }
}

struct DisplayNormalRegular : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.system(size: 18,weight: .regular))
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
        return content.font(.system(size: 24,weight: .bold))
    }
}
struct DisplayButtonSmall : ViewModifier{
    func body(content: Content) -> some View {
        return content.font(.system(size: 14,weight: .bold))
    }
}



