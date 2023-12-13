//
//  ChangePasswordView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 08.02.2024.
//

import SwiftUI

struct ChangePasswordView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var myVM = MyDetailsViewModel.shared
    
    var body: some View {
        ZStack {
            
            ScrollView {
                VStack(spacing: 15) {
                    
                    LineSecureField(title: "Current Password", placeholder: "Enter your current password",   txt: $myVM.txtCurrentPassword, isShowPassword: $myVM.isShowCurrentPassword)
                        .padding(.bottom, .screenWidth * 0.02)
                    
                    LineSecureField(title: "New Password", placeholder: "Enter your new password",   txt: $myVM.txtNewPassword, isShowPassword: $myVM.isShowNewPassword)
                        .padding(.bottom, .screenWidth * 0.02)
                    
                    LineSecureField(title: "Confirm Password", placeholder: "Confirm your password",   txt: $myVM.txtConfirmPassword, isShowPassword: $myVM.isShowConfirmPassword)
                        .padding(.bottom, .screenWidth * 0.02)
                    
                    
                    
                    RoundButton2(title:  "Change Password") {
                        myVM.serviceCallChangePassword()
                    }
                    .padding(.bottom, 15)
                }
            }
            .padding(20)
            .padding(.top, .topInsets + 55)
            
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
                    
                    Text("Change Password")
                        .font(.customfont(.bold, fontSize: 20))
                        .foregroundColor(.primaryText)
                        .frame(height: 40)
                        .padding(.leading, -35)
                    Spacer()
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                Spacer()
            }
        }
        .sheet(isPresented: $myVM.isShowPicker, content: {
            CountryPickerUI(country: $myVM.countryObj)
        })
        .alert(isPresented: $myVM.showError) {
            Alert(title: Text(Globs.AppName), message: Text(myVM.errorMessage), dismissButton: .default(Text("OK")))
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    ChangePasswordView()
}
