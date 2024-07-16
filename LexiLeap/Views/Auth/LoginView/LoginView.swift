//
//  LoginView.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 14.07.2024.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var vm = LoginViewViewModel()
    
    var body: some View {
        NavigationStack{
            GeometryReader{geometry in
                
                ZStack{
                    
                    VStack{
                        Rectangle().clipShape(RoundedRectangle(cornerRadius: ProjectRadius.extraLarge.rawValue)).foregroundStyle(.estateBlue)/*.padding(.bottom,geometry.dh(height: 0.45))*/
                            .frame(height: geometry.dh(height: 0.70))
                        Spacer()
                        
                    }.ignoresSafeArea()
                    
                    VStack{
                        
                        
                        //                        Welcome text
                        HStack {
                            Text(LocaleKeys.AuthView.welconeLoginText.rawValue.locale())
                                .modifier(DisplayMediumRegular())
                                .foregroundColor(.white)
                            Spacer()
                        }.padding(.top,ProjectPaddings.small.rawValue)
                        
                        
                        //                        Login form
                        VStack(spacing:ProjectPaddings.large.rawValue) {
                            HStack {
                                TextField("E-Posta", text: $vm.email)
                                
                                    .padding(.horizontal)
                                    .padding(.vertical,ProjectPaddings.small.rawValue)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.small.rawValue))
                                Spacer()
                            }
                            
                            
                            HStack {
                                SecureField("Şifre", text: $vm.password)
                                
                                    .padding(.horizontal)
                                    .padding(.vertical,ProjectPaddings.small.rawValue)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.small.rawValue))
                                Spacer()
                            }
                        }.padding(.top,ProjectPaddings.massive.rawValue)
                        
                        //                        Forgot button
                        JustTextButton(action: {}, text: LocaleKeys.AuthView.forgotPassword.rawValue.locale())
                        
                        //                        Login button
                        TextButtonWithBg(action:{
                            vm.signIn()
                        },text: LocaleKeys.General.login.rawValue.locale())
                        
                        //         Or text
                        HStack {
                            Spacer()
                            Text(LocaleKeys.General.or.rawValue.locale())
                                .modifier(DisplayButtonSmall())
                                .foregroundStyle(.princetonOrange)
                                .padding(.top,100)
                            Spacer()
                            
                        }
                        
                        //                        Sign in with google button
                        HStack(alignment:.center){
                            OtherAuthMethodButton(action: {}, icon: ProjectImages.Icons.icGoogle.rawValue, text: LocaleKeys.AuthView.signInWithGoogle.rawValue.locale())
                            
                            Spacer()
                        }
                        
                        
                        .frame(width: geometry.dw(width:0.8))
                        .frame(height:  geometry.dh(height:0.07))
                        .background(.estateBlue)
                        .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.large.rawValue))
                        .padding(.top,ProjectPaddings.large.rawValue)
                        
                        
                        //                        Sign in with apple button
                        
                        HStack(alignment:.center){
                            OtherAuthMethodButton(action: {}, icon: ProjectImages.Icons.icApple.rawValue, text: LocaleKeys.AuthView.signInWithApple.rawValue.locale())
                            
                            Spacer()
                        }
                        .frame(width: geometry.dw(width:0.8))
                        .frame(height:  geometry.dh(height:0.07))
                        .background(.estateBlue)
                        .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.large.rawValue))
                        .padding(.top,ProjectPaddings.normal.rawValue)
                        
                        HStack {
                            Spacer()
                            
                            JustTextButton(action: {vm.gotoSignUpView = true}, text: LocaleKeys.AuthView.createAccount.rawValue.locale())
                            Spacer()
                        }.padding(.top,ProjectPaddings.normal.rawValue)
                        
                        Spacer()
                    }.padding(.all,ProjectPaddings.normal.rawValue)
                        .navigationDestination(isPresented: $vm.gotoSignUpView) {
                            SignUpView()
                        }
                        .navigationDestination(isPresented: $vm.gotoSettingsView) {
                            SettingsView()
                        }
                }.toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text(LocaleKeys.General.login.rawValue.locale())
                            .modifier(DisplayExtraLargeBold())
                            .foregroundColor(.white) // Başlık rengi buradan değiştirilebilir
                    }
                }
                
            }.navigationBarBackButtonHidden()
            
        }
    }
}

#Preview {
    LoginView()
}

struct ExtractedView: View {
    var body: some View {
        Button(action: {
            
        }) {
            Text(LocaleKeys.General.login.rawValue.locale())
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
