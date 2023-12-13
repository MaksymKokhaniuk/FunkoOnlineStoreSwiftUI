//
//  MyDetailsView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 07.02.2024.
//

import SwiftUI
import CountryPicker

struct MyDetailsView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var myVM = MyDetailsViewModel.shared
    
    var body: some View {
        ZStack {
            
            ScrollView {
                VStack(spacing: 15) {
                    
                    LineTextField(title: "Name", placeholder: "Enter your name" , txt: $myVM.txtName, keyboardType: .numberPad)
                    
                    VStack {
                        Text("Mobile")
                            .font(.customfont(.bold , fontSize: 16))
                            .foregroundColor(.secondaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        
                        HStack{
                            Button{
                                myVM.isShowPicker = true
                            } label: {
                                if let countryObj = myVM.countryObj {
                                    Text("\(countryObj.isoCode.getFlag())")
                                        .font(.customfont(.regular, fontSize: 20))
                                    
                                    Text("+\(countryObj.phoneCode)")
                                        .keyboardType(.numberPad)
                                        .font(.customfont(.regular, fontSize: 14))
                                        .foregroundColor(.black)
                                }
                            }
                            TextField("Enter your mobile",  text: $myVM.txtMobile)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .font(.customfont(.regular, fontSize: 14))
                            
                        }
                        
                        Divider()
                    }
                    
                    
                    
                    LineTextField(title: "Username", placeholder: "Enter your username" , txt: $myVM.txtUsername)
                    
                    RoundButton2(title:  "Update") {
                        myVM.serviceCallUpdate()
                    }
                    .padding(.bottom, 15)
                    
                    NavigationLink {
                        ChangePasswordView()
                    } label: {
                        Text("Change Password")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.primaryText)
                    }

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
                    
                    Text("My Details")
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
    NavigationView {
        MyDetailsView()
    }
}
