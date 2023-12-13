//
//  SignUpView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 29.01.2024.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var mainVM = MainViewModel.shared;
    
    var body: some View {
        ZStack{
            
            ScrollView {
                VStack {
                    
                    Image("funko_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 60)
                        .padding(.bottom, .screenWidth * 0.1)
                    
                    Text("Sign Up")
                        .font(.customfont(.bold , fontSize: 26))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 4)
                    
                    Text("Enter your information to continue")
                        .font(.customfont(.bold , fontSize: 16))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, .screenWidth * 0.1)
                    
                    LineTextField(title: "Username", placeholder: "Enter your username",txt: $mainVM.txtUsername)
                        .padding(.bottom, .screenWidth * 0.07)
                    
                    LineTextField(title: "Email", placeholder: "Enter your email adress",txt: $mainVM.txtEmail, keyboardType: .emailAddress)
                        .padding(.bottom, .screenWidth * 0.07)
                    
                    LineSecureField(title: "Password", placeholder: "Enter your password",   txt: $mainVM.txtPassword, isShowPassword: $mainVM.isShowPassword)
                        .padding(.bottom, .screenWidth * 0.04)
                    
                    VStack {
                        
                        Text("By continued you agree to our")
                            .font(.customfont(.medium , fontSize: 14))
                            .foregroundColor(.secondaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            Text("Terms of Service")
                                .font(.customfont(.medium , fontSize: 14))
                                .foregroundColor(.ButtonCol)
                            
                            Text(" and ")
                                .font(.customfont(.medium , fontSize: 14))
                                .foregroundColor(.secondaryText)
                            
                            Text("Privacy Policy.")
                                .font(.customfont(.medium , fontSize: 14))
                                .foregroundColor(.ButtonCol)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.bottom, .screenWidth * 0.02)
                    }
                    
                    RoundButton2(title: "Sign Up") {
                        mainVM.serviceCallSignUp()
                    }
                    .padding(.bottom, .screenWidth * 0.05)
                    
                    NavigationLink {
                        LoginView()
                    } label: {
                        HStack {
                            Text("Already have an account?")
                                .font(.customfont(.bold , fontSize: 14))
                                .foregroundColor(.primaryText)
                            
                            Text("Sign In")
                                .font(.customfont(.bold , fontSize: 14))
                                .foregroundColor(.ButtonCol)

                        }
                    }

                    
                    
                    Spacer()
                    
                }
                .padding(.top, .topInsets + 64)
                .padding(.horizontal, 20)
                .padding(.bottom, .bottomInsets)
            }
            
            VStack{
                
                HStack {
                    Button{
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35)
                    }
                    Spacer()
                    
                }
                
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
        }
        .alert(isPresented: $mainVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(mainVM.errorMessage), dismissButton: .default(Text("Ok")))
        })
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    SignUpView()
}
