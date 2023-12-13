//
//  MyCartView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 03.02.2024.
//

import SwiftUI

struct MyCartView: View {
    
    @StateObject var cartVM = CartViewModel.shared
    var body: some View {
        ZStack {
            
            if(cartVM.listArr.count == 0) {
                Text("Your Cart Is Empty")
                    .font(.customfont(.bold, fontSize: 20))
            }
            
            ScrollView {
                LazyVStack {
                    ForEach(cartVM.listArr, id: \.id , content: {
                        cObj in
                        
                        CartItemRow(cObj: cObj)
                        })
                    .padding(.top, 15)
                }
                
            }
            .padding(.top, .topInsets + 45)
            .padding(.bottom, .bottomInsets + 45)
                VStack {
                    
                    HStack {
                        Spacer()
                        Text("My Cart")
                            .font(.customfont(.bold, fontSize: 20))
                            .foregroundColor(.primaryText)
                            .frame(height: 10)
                        Spacer()
                        
                    }
                    .padding(.top, .topInsets)
                    Spacer()
                    
                    if(cartVM.listArr.count > 0) {
                        Button {
                            cartVM.showCheckout = true
                        } label: {
                            ZStack {
                                Text("Check Out")
                                    .font(.customfont(.bold, fontSize: 24))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                
                                HStack{
                                    Spacer()
                                    Text("$\(cartVM.total)")
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(Color.darkGray.opacity(0.2))
                                        .font(.customfont(.bold, fontSize: 12))
                                        .cornerRadius(5)
                                    
                                }
                                .padding(.trailing)
                                
                            }
                            
                        }
                        .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
                        .background(Color.ButtonCol)
                        .cornerRadius(15)
                    }
                    
                }
                .padding(20)
            
            if(cartVM.showCheckout) {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            cartVM.showCheckout = false
                        }
                    }
                
                CheckoutView(isShow: $cartVM.showCheckout)
                    .transition(.opacity.combined(with: .move(edge: .bottom)))
            }
        }
        .onAppear {
            cartVM.serviceCallList()
        }
        .background(NavigationLink(destination: OrderAcceptView(), isActive: $cartVM.showOrderAccept ,label: {
                EmptyView()
            }))
        .alert(isPresented: $cartVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(cartVM.errorMessage), dismissButton: .default(Text("OK")))
        })
        .animation(.easeInOut, value: cartVM.showCheckout)
        .ignoresSafeArea()
        
    }
}

#Preview {
    NavigationView {
        MyCartView()
    }
}
