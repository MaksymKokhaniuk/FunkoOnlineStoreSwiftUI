//
//  OTPView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 08.02.2024.
//

import SwiftUI

struct OTPView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var forgotPassVM = ForgotPasswordViewModel.shared;
    
    var body: some View {
        ZStack {
            
            VStack {
                
                Text("Enter your 4-digit code")
                    .font(.customfont(.bold , fontSize: 26))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 8)
                
                LineTextField(title: "Code", placeholder: "- - - -",txt: $forgotPassVM.txtResetCode, keyboardType: .phonePad)
                    .padding(.bottom, .screenWidth * 0.07)
                
                Button {
                    forgotPassVM.serviceCallRequest()
                } label: {
                    Text("Resend Code")
                        .font(.customfont(.bold , fontSize: 18))
                        .foregroundColor(.primaryText)
                }
                .padding(.bottom, .screenWidth * 0.05)
                
                RoundButton2(title: "Verify") {
                    forgotPassVM.serviceCallVerify()
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
    OTPView()
}
