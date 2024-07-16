//
//  RootView.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 16.07.2024.
//

import SwiftUI

struct RootView: View {
    @State private var showSignInView : Bool = false
    var body: some View {
        ZStack{
            NavigationStack{
                SettingsView(showSignInView: $showSignInView)
                    .environment(\.colorScheme,.light)
            }
        }
        .onAppear{
            let authUser = try? AuthManager.shared.getAuthedUser()
            self.showSignInView = authUser == nil
        }
        .fullScreenCover(isPresented: $showSignInView, content: {
            NavigationStack{
                SignUpView()
                    .environment(\.colorScheme,.light)
            }
        })
       
    }
}

#Preview {
    RootView()
}
