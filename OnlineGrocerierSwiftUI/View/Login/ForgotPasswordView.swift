//
//  ForgotPasswordView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 08.02.2024.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var forgotPassVM = ForgotPasswordViewModel.shared;
    
    var body: some View {
        ZStack {
            
            VStack {
                
                Image("funko_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 60)
                    .padding(.bottom, .screenWidth * 0.1)
                
                Text("Forgot Password")
                    .font(.customfont(.bold , fontSize: 26))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 4)
                
                Text("Enter your email address")
                    .font(.customfont(.bold , fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, .screenWidth * 0.1)
                
                LineTextField(title: "Email", placeholder: "Enter your email adress",txt: $forgotPassVM.txtEmail, keyboardType: .emailAddress)
                    .padding(.bottom, .screenWidth * 0.07)
                
                RoundButton2(title: "Submit") {
                    forgotPassVM.serviceCallRequest()
                }
                .padding(.bottom, .screenWidth * 0.05)
                
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
        .alert(isPresented: $forgotPassVM.showError) {
            Alert(title: Text(Globs.AppName), message: Text( forgotPassVM.errorMessage ), dismissButton: .default(Text("Ok")))
        }
        .background(NavigationLink(destination: OTPView(), isActive: $forgotPassVM.isShowVerify, label: {
            EmptyView()
        }))
        .background(NavigationLink(destination: ForgotPasswordSetView(), isActive: $forgotPassVM.isShowSetPassword, label: {
            EmptyView()
        }))
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        ForgotPasswordView()
    }
}
