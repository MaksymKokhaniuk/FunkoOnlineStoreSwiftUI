//
//  CheckoutView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 06.02.2024.
//

import SwiftUI

struct CheckoutView: View {
    
    @Binding var isShow: Bool
    
    @StateObject var cartVM =  CartViewModel.shared
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                HStack {
                    Text("Checkout")
                        .font(.customfont(.bold, fontSize: 20))
                        .foregroundColor(.primaryText)
                        .frame(height: 46)
                    Spacer()
                    
                    Button {
                        $isShow.wrappedValue = false
                    } label: {
                        Image("close")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35)
                    }
                    
                    
                }
                .padding(.top, 30)
                
                Divider()
                
                VStack {
                    HStack {
                        Text("Delivery Type")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.secondaryText)
                            .frame(height: 40)
                        
                        Spacer()
                        
                        Picker("", selection: $cartVM.deliveryType) {
                            Text("Delivery").tag(1)
                            Text("Collection").tag(2)
                        }
                        .pickerStyle(.segmented)
                        .frame(width: 180)
                        
                    }
                    
                    Divider()
                    
                    if(cartVM.deliveryType == 1) {
                        NavigationLink {
                            DeliveryAddressView(isPicker: true, didSelect: {
                                aObj in
                                cartVM.deliverObj = aObj
                            })
                        } label: {
                            HStack {
                                Text("Delivery")
                                    .font(.customfont(.bold, fontSize: 18))
                                    .foregroundColor(.secondaryText)
                                    .frame(height: 40)
                                
                                Spacer()
                                
                                Text(cartVM.deliverObj?.name ?? "Select Address")
                                    .font(.customfont(.bold, fontSize: 18))
                                    .foregroundColor(.primaryText)
                                    .frame(height: 40)
                                
                                Image("next")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                            }
                        }
                        
                        Divider()
                    }
                    
                    HStack {
                        Text("Payment Type")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.secondaryText)
                            .frame(height: 40)
                        
                        Spacer()
                        
                        Picker("", selection: $cartVM.paymentType) {
                            Text("COD").tag(1)
                            Text("Online").tag(2)
                        }
                        .pickerStyle(.segmented)
                        .frame(width: 150)
                    }
                    
                    Divider()
                    
                    if(cartVM.paymentType == 2) {
                        NavigationLink {
                            PaymentMethodsView(isPicker: true, didSelect: {
                                pObj in
                                cartVM.paymentObj = pObj
                            })
                        } label: {
                            HStack {
                                Text("Payment")
                                    .font(.customfont(.bold, fontSize: 18))
                                    .foregroundColor(.secondaryText)
                                    .frame(height: 40)
                                
                                Spacer()
                                
                                Image("card")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                
                                Text(cartVM.paymentObj?.cardNumber ?? "Select")
                                    .font(.customfont(.bold, fontSize: 18))
                                    .foregroundColor(.primaryText)
                                    .frame(height: 40)
                                
                                Image("next")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                            }
                        }
                        Divider()
                    }
                    
                    NavigationLink {
                        PromoCodeView(isPicker: true, didSelect: {
                            pObj in
                            cartVM.promoObj = pObj
                        })
                    } label: {
                        HStack {
                            Text("Promo Code")
                                .font(.customfont(.bold, fontSize: 18))
                                .foregroundColor(.secondaryText)
                                .frame(height: 40)
                            
                            Spacer()
                            
                            Text(cartVM.promoObj?.code ?? "Pick Discount")
                                .font(.customfont(.bold, fontSize: 18))
                                .foregroundColor(.primaryText)
                                .frame(height: 40)
                            
                            Image("next")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                    }
                    
                    Divider()
                }
                
                VStack {
                    HStack {
                        Text("Total")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                        
                        Spacer()
                        
                        Text("$ \(cartVM.total)")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                        
                    }
                    
                    HStack {
                        Text("Delivery Cost")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                        
                        Spacer()
                        
                        Text("+ $ \(cartVM.deliverPriceAmount)")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                        
                    }
                    
                    HStack {
                        Text("Discount")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.secondaryText)
                        
                        Spacer()
                        
                        Text("- $ \(cartVM.discountAmount)")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(Color.RedCol)
                        
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 15)
                
                HStack {
                    Text("Final Total")
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundColor(.secondaryText)
                        .frame(height: 40)
                    
                    Spacer()
                    
                    Text("$ \(cartVM.userPayAmount)")
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundColor(.primaryText)
                        .frame(height: 40)
                    
                    Image("next")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
                Divider()
                
                VStack {
                    
                    Text("By continued you agree to our")
                        .font(.customfont(.medium , fontSize: 14))
                        .foregroundColor(.secondaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        Text("Terms of Service")
                            .font(.customfont(.medium , fontSize: 14))
                            .foregroundColor(.primaryText)
                        
                        Text(" and ")
                            .font(.customfont(.medium , fontSize: 14))
                            .foregroundColor(.secondaryText)
                        Text("Privacy Policy.")
                            .font(.customfont(.medium , fontSize: 14))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(.vertical, .screenWidth * 0.03)
                
                RoundButton2(title: "Place Order") {
                    cartVM.serviceCallOrderPlace()
                }
                .padding(.bottom, .bottomInsets - 15)
            }
            .padding(.horizontal, 20)
            .padding(.top, 15)
            .background(Color.white)
            .cornerRadius(20)
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    @State static var isShow: Bool = false;
    static var previews: some View {
        NavigationView {
            CheckoutView(isShow: $isShow)
        }
    }
}
