//
//  OrderAcceptView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 06.02.2024.
//

import SwiftUI

struct OrderAcceptView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                Image("order_accept")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .screenWidth * 0.6)
                    .padding(.bottom, 32)
                
                Text("Your order has been \naccepted")
                    .multilineTextAlignment(.center)
                    .font(.customfont(.bold, fontSize: 28))
                    .foregroundColor(.primaryText)
                    .padding(.bottom, 12)
                
                Text("Your items has been placed and is on\nit's way being processed")
                    .multilineTextAlignment(.center)
                    .font(.customfont(.bold, fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .padding(.bottom, 12)
                
                Spacer()
                Spacer()
                
                RoundButton2(title: "Track Order") {
                    
                }
                
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Text("Back to home")
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundColor(.primaryText)
                        .padding(.vertical, 15)
                }
                .padding(.bottom, 20)
            }
            .padding(.horizontal, 20)
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    OrderAcceptView()
}
