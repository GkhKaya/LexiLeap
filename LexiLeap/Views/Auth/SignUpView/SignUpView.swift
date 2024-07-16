//
//  SignUpView.swift
//  LexiLeap
//
//  Created by Gokhan Kaya on 15.07.2024.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject private var vm = SignUpViewModel()
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
                        
                        //                        Title
                        //                        HStack {
                        //                            Text(LocaleKeys.General.register.rawValue.locale())
                        //                                .modifier(DisplayExtraLargeBold())
                        //                                .foregroundStyle(.white)
                        //                            Spacer()
                        //                        }
                        //                        Welcome text
                        HStack {
                            Text(LocaleKeys.AuthView.welconeSignUpText.rawValue.locale())
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
                        Button{
                            
                        }label: {
                            HStack{
                                Text(LocaleKeys.AuthView.forgotPassword.rawValue.locale())
                                    .foregroundStyle(.princetonOrange)
                                    .modifier(DisplayButtonSmall())
                                Spacer()
                            }.padding(.top,ProjectPaddings.extraSmall.rawValue)
                        }
                        
                        //                        Register button
                        TextButtonWithBg(action:{vm.createUser()},text: LocaleKeys.General.register.rawValue.locale())
                        
                        //         Or text
                        HStack {
                            Spacer()
                            Text(LocaleKeys.General.or.rawValue.locale())
                                .modifier(DisplayButtonSmall())
                                .foregroundStyle(.princetonOrange)
                                .padding(.top,100)
                            Spacer()
                            
                        }
                        
                        //                        Sign up with google button
                        HStack(alignment:.center){
                            OtherAuthMethodButton(action: {}, icon: ProjectImages.Icons.icGoogle.rawValue, text: LocaleKeys.AuthView.signUpWithGoogle.rawValue.locale())
                            
                            Spacer()
                        }
                        
                        .frame(width: geometry.dw(width:0.8))
                        .frame(height:  geometry.dh(height:0.07))
                        .background(.estateBlue)
                        .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.large.rawValue))
                        .padding(.top,ProjectPaddings.large.rawValue)
                        
                        //                        Sign up with apple button
                        
                        HStack(alignment:.center){
                            OtherAuthMethodButton(action: {}, icon: ProjectImages.Icons.icApple.rawValue, text: LocaleKeys.AuthView.signUpWithApple.rawValue.locale())
                            
                            Spacer()
                        }
                        .frame(width: geometry.dw(width:0.8))
                        .frame(height:  geometry.dh(height:0.07))
                        .background(.estateBlue)
                        .clipShape(RoundedRectangle(cornerRadius: ProjectRadius.large.rawValue))
                        .padding(.top,ProjectPaddings.normal.rawValue)
                        Spacer()
                    }.padding(.all,ProjectPaddings.normal.rawValue)
                    
                }.toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text(LocaleKeys.General.register.rawValue.locale())
                            .modifier(DisplayExtraLargeBold())
                            .foregroundColor(.white) // Başlık rengi buradan değiştirilebilir
                    }
                }
                
            }
        }
    }
}

#Preview {
    SignUpView()
}
