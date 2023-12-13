//
//  ForgotPasswordSetView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 08.02.2024.
//

import SwiftUI

struct ForgotPasswordSetView: View {
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
                
                Text("Set New Password")
                    .font(.customfont(.bold , fontSize: 26))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 4)
                
                Text("Enter your new password")
                    .font(.customfont(.bold , fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, .screenWidth * 0.1)
                
                LineSecureField(title: "New Password", placeholder: "Enter your new password",   txt: $forgotPassVM.txtNewPassword, isShowPassword: $forgotPassVM.isShowNewPassword)
                    .padding(.bottom, .screenWidth * 0.02)
                
                LineSecureField(title: "Confirm Password", placeholder: "Confirm your password",   txt: $forgotPassVM.txtConfirmPassword, isShowPassword: $forgotPassVM.isShowConfirmPassword)
                    .padding(.bottom, .screenWidth * 0.04)
                
                RoundButton2(title: "Submit") {
                    forgotPassVM.serviceCallSetPassword()
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
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    ForgotPasswordSetView()
}
