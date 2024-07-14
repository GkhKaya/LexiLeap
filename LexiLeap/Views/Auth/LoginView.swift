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
                            .frame(height: geometry.dh(height: 0.65))
                        Spacer()
                            
                    }
                    
                    VStack{
                        
//                        Title
                        HStack {
                            Text(LocaleKeys.General.login.rawValue.locale())
                                .modifier(DisplayExtraLargeBold())
                                .foregroundStyle(.white)
                            Spacer()
                        }.padding(.top,ProjectPaddings.huge.rawValue)
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
                                SecureField("Şifre", text: $vm.email)
                                
                                    .padding(.horizontal)
                                    .padding(.vertical,ProjectPaddings.small.rawValue)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.small.rawValue))
                                Spacer()
                            }
                        }.padding(.top,ProjectPaddings.massive.rawValue)
                           
//                        Forgot button
                        Button{
                            
                        }label: {
                            HStack{
                                Text(LocaleKeys.AuthView.forgotPassword.rawValue.locale())
                                    .foregroundStyle(.princetonOrange)
                                    .modifier(DisplayButtonSmall())
                                Spacer()
                            }.padding(.top,ProjectPaddings.extraSmall.rawValue)
                        }
                       
//                        Login button
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
                        
//         Or text
                        Text(LocaleKeys.General.or.rawValue.locale())
                            .modifier(DisplayButtonSmall())
                            .foregroundStyle(.princetonOrange)
                            .padding(.top,100)
                        
//                        Sign in with google button
                        HStack(alignment:.center){
                            Image(ProjectImages.Icons.icGoogle.rawValue)
                                .padding(.trailing,ProjectPaddings.normal.rawValue)
                                .padding(.leading,ProjectPaddings.normal.rawValue)
                            Text(LocaleKeys.AuthView.signInWithGoogle.rawValue.locale())
                                .foregroundStyle(.white)
                                .modifier(DisplayMediumBold())
                            Spacer()
                        }
                        
                        .frame(width: geometry.dw(width:0.8))
                        .frame(height:  geometry.dh(height:0.07))
                        .background(.estateBlue)
                        .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.large.rawValue))
                        .padding(.top,ProjectPaddings.large.rawValue)
                        
//                        Sign in with apple button

                        HStack(alignment:.center){
                            Image(ProjectImages.Icons.icApple.rawValue)
                                .padding(.trailing,ProjectPaddings.normal.rawValue)
                                .padding(.leading,ProjectPaddings.normal.rawValue)
                            Text(LocaleKeys.AuthView.signUpWithApple.rawValue.locale())
                                .foregroundStyle(.white)
                                .modifier(DisplayMediumBold())
                            Spacer()
                        }
                        .frame(width: geometry.dw(width:0.8))
                        .frame(height:  geometry.dh(height:0.07))
                        .background(.estateBlue)
                        .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.large.rawValue))
                        .padding(.top,ProjectPaddings.normal.rawValue)
                        Spacer()
                    }.padding(.all,ProjectPaddings.normal.rawValue)
                }.ignoresSafeArea()
                
            }
        }
    }
}

#Preview {
    LoginView()
}
