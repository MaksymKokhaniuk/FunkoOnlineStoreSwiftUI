//
//  WelcomeView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 29.12.2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Image("funko_logo")
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
            
            VStack {
                Spacer()
                
                Text("Welcome")
                    .font(.customfont(.regular, fontSize: 48))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                
                Text("Collect all pops")
                    .font(.customfont(.regular, fontSize: 24))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 10)
                
                NavigationLink {
                    SignInView()
                } label: {
                    RoundButton(title: "Get Started") {
                    }
                }
                
                
                    Spacer()
                        .frame(height: 120)
            }
            .padding(.horizontal , 20)
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        WelcomeView()
    }
    
}
