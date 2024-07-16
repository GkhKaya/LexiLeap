//
//  SettingsView.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 16.07.2024.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject private var vm = SettingsViewModel()
//    @Binding var showSignInView : Bool
    var body: some View {
        NavigationStack{
            List{
                Button{
                    Task{
                        do{
                            try vm.logOut()
                            //                        showSignInView = true
                        }catch{
                            print(error)
                        }
                    }
                }label:{
                    Text("Log out")
                }
            }.navigationDestination(isPresented: $vm.goToSignInView) {
                LoginView()
            }
        }
    }
}

//#Preview {
//    SettingsView()
//}
