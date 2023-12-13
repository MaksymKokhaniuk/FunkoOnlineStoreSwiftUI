//
//  LoginView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 03.01.2024.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var loginVM = MainViewModel.shared;
    
    var body: some View {
        ZStack {
            VStack {
                
                Image("funko_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 60)
                    .padding(.bottom, .screenWidth * 0.1)
                
                Text("Loging")
                    .font(.customfont(.bold , fontSize: 26))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 4)
                
                Text("Enter your email and password")
                    .font(.customfont(.bold , fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, .screenWidth * 0.1)
                
                LineTextField(title: "Email", placeholder: "Enter your email adress",txt: $loginVM.txtEmail, keyboardType: .emailAddress)
                    .padding(.bottom, .screenWidth * 0.07)
                
                LineSecureField(title: "Password", placeholder: "Enter your password",   txt: $loginVM.txtPassword, isShowPassword: $loginVM.isShowPassword)
                    .padding(.bottom, .screenWidth * 0.02)
                
                NavigationLink {
                    ForgotPasswordView()
                } label: {
                    Text("Forgot Password?")
                        .font(.customfont(.medium , fontSize: 14))
                        .foregroundColor(.primaryText)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .padding(.bottom, .screenWidth * 0.03)
                
                RoundButton2(title: "Login") {
                    loginVM.serviceCallLogin()
                }
                .padding(.bottom, .screenWidth * 0.05)
                
                NavigationLink {
                    SignUpView()
                } label: {
                    HStack {
                        Text("Don't have an account?")
                            .font(.customfont(.bold , fontSize: 14))
                            .foregroundColor(.primaryText)
                        
                        Text("Sign Up")
                            .font(.customfont(.bold , fontSize: 14))
                            .foregroundColor(.ButtonCol)
                    }
                }
                
                Spacer()
                
            }
            .padding(.top, .topInsets + 64)
            .padding(.horizontal, 20)
            .padding(.bottom, .bottomInsets)
            
            VStack {
                HStack {
                    Button {
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
        .alert(isPresented: $loginVM.showError) {
            Alert(title: Text(Globs.AppName), message: Text( loginVM.errorMessage ), dismissButton: .default(Text("Ok")))
        }
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        LoginView()
    }
    
}
