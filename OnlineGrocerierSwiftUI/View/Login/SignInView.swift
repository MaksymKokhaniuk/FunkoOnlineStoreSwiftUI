//
//  SignInView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 30.12.2023.
//

import SwiftUI

struct SignInView: View {
    
    @State var txtMobile: String = ""
    
    var body: some View {
        ZStack{
            Image("funko_logo")
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .padding(.top, -150)
            
            ScrollView {
                
                VStack(alignment: .leading)
                {
                    Text("Get your pops")
                        .font(.customfont(.regular, fontSize: 26))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 100)                    
                    
                    NavigationLink {
                        LoginView()
                    } label: {
                        Text("Login")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame( minWidth: 0, maxWidth: 400, minHeight: 50, maxHeight: 60 )
                    .background(Color.ButtonCol)
                    .cornerRadius(15)
                    .padding(.top,20)
                    
                    NavigationLink {
                        SignUpView()
                    } label: {
                        Text("Sign Up")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame( minWidth: 0, maxWidth: 400, minHeight: 50, maxHeight: 60 )
                    .background(Color.ButtonCol)
                    .cornerRadius(15)
                    .padding(.top,20)

                    
                    Divider()
                        .padding(.top, -8)
                    
                    Text("Or connect with social media")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundColor(.secondaryText)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .padding(.top, 20)
                    
                    Button {
                    
                    } label: {
                        Image("google_logo")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Text("Continue with Google")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }
                    .frame( minWidth: 0, maxWidth: 400, minHeight: 50, maxHeight: 60 )
                    .background(Color.ButtonCol)
                    .cornerRadius(15)
                    .padding(.top,20)
                    
                    Button {
                    
                    } label: {
                        Image("facebook_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            
                        Text("Continue with Facebook")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                    }
                    .frame( minWidth: 0, maxWidth: 400, minHeight: 50, maxHeight: 60)
                    .background(Color.ButtonCol)
                    .cornerRadius(15)
                    .padding(.top,20)
                    
                }
                .padding(.horizontal, 25)
                .frame(width: .screenWidth, alignment: .leading)
                .padding(.top, .topInsets + .screenWidth * 0.6)
                
                
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
    
    
}

#Preview {
    SignInView()
}
