//
//  RootView.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 16.07.2024.
//

import SwiftUI

struct RootView: View {
    @State private var isLoggedIn = CacheManager.shared.isUserloggedIn
    var body: some View {
        ZStack{
            if isLoggedIn{
                NavigationStack{
                    SettingsView()
                }
            }else{
                NavigationStack{
                    LoginView()
                }
            }
        }
       
    }
}

#Preview {
    RootView()
}


//NavigationStack{
//    SettingsView(showSignInView: $showSignInView)
//        .environment(\.colorScheme,.light)
//}
//}
//.onAppear{
//let authUser = try? AuthManager.shared.getAuthedUser()
//self.showSignInView = authUser == nil
//}
//.fullScreenCover(isPresented: $showSignInView, content: {
//NavigationStack{
//    LoginView(showSignInView: $showSignInView)
//        .environment(\.colorScheme,.light)
//}
