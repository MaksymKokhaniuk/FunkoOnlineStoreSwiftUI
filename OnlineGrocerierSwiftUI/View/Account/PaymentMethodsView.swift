//
//  PaymentMethodsView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 06.02.2024.
//

import SwiftUI

struct PaymentMethodsView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var payVM = PaymentViewModel.shared
    
    @State var isPicker: Bool = false
    var didSelect: ((_ obj: PaymentModel) -> () )?
    
    var body: some View {
        ZStack {
            
            ScrollView {
                LazyVStack(spacing: -15) {
                    ForEach(payVM.listArr, id: \.id , content: {
                        pObj in
                        
                        HStack(spacing: 15) {
                            
                            Image("credit_card")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                            
                            VStack(spacing: 4) {
                                HStack {
                                    Text(pObj.name)
                                        .font(.customfont(.bold, fontSize: 18))
                                        .foregroundColor(.primaryText)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    
                                }
                                
                                Text("**** **** **** \(pObj.cardNumber)")
                                    .font(.customfont(.medium, fontSize: 15))
                                    .foregroundColor(.primaryText)
                                    .multilineTextAlignment(.leading)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                            }
                            
                            
                            Button {
                                payVM.serviceCallRemove(pObj: pObj)
                            } label: {
                                Image("cancel")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                            }
                        }
                        .padding(15)
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(color: Color.black.opacity(0.15), radius: 2)
                        .onTapGesture {
                            if(isPicker){
                                mode.wrappedValue.dismiss()
                                didSelect?(pObj)
                            }
                        }
                        
                        
                    })
                    .padding(15)
                }
                
            }
            .padding(.top, .topInsets + 55)
            .padding(.bottom, .bottomInsets + 55)
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
                    
                    Text("Payment Methods")
                        .font(.customfont(.bold, fontSize: 20))
                        .foregroundColor(.primaryText)
                        .frame(height: 40)
                        .padding(.leading, -10)
                    Spacer()
                    
                    NavigationLink {
                        AddPaymentMethodView()
                    } label: {
                        Image("plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                Spacer()
            }
            
            
        }
        .alert(isPresented: $payVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(payVM.errorMessage))
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
        
    }
}

#Preview {
    
    NavigationView {
        PaymentMethodsView()
    }
}
