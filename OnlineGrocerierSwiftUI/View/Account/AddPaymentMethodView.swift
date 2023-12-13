//
//  AddPaymentMethodView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 06.02.2024.
//

import SwiftUI

struct AddPaymentMethodView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var payVM = PaymentViewModel.shared
    
    var body: some View {
        ZStack {
            
            ScrollView {
                VStack(spacing: 15) {
                    
                    
                    LineTextField(title: "Name", placeholder: "Enter your name" , txt: $payVM.txtName)
                    
                    LineTextField(title: "Card number", placeholder: "Enter card number" , txt: $payVM.txtCardNumber, keyboardType: .numberPad)
                    
                    HStack {
                        LineTextField(title: "MM", placeholder: "Enter card month" , txt: $payVM.txtCardMonth, keyboardType: .numberPad)
                        
                        LineTextField(title: "YYYY", placeholder: "Enter card year" , txt: $payVM.txtCardYear, keyboardType: .numberPad)
                    }
                    
                    RoundButton2(title: "Add Payment Method") {
                        
                        payVM.serviceCallAdd {
                            self.mode.wrappedValue.dismiss()
                        }
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
                    
                    Text("Add Payment Method")
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
        .alert(isPresented: $payVM.showError) {
            Alert(title: Text(Globs.AppName), message: Text(payVM.errorMessage), dismissButton: .default(Text("OK")))
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    AddPaymentMethodView()
}
