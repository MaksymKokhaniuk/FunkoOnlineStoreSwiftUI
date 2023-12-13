//
//  AccountView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 04.02.2024.
//

import SwiftUI

struct AccountView: View {
    @StateObject var myVM = MyDetailsViewModel.shared
    
    var body: some View {
        ZStack {
            VStack {
                
                HStack(spacing: 15) {
                    Image("u1")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .cornerRadius(30)
                    
                    VStack {
                            Text(myVM.txtUsername)
                                .font(.customfont(.bold, fontSize: 20))
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.primaryText)
                        
                        Text("+\(myVM.txtMobile)")
                            .font(.customfont(.regular, fontSize: 14))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .accentColor(.secondaryText)
                        
                    }
                    
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, .topInsets)
                
                Rectangle()
                    .frame(width: 370, height: 1)
                    .frame(minWidth: 0, maxWidth: .infinity)
                
                ScrollView {
                    LazyVStack {
                        VStack{
                            NavigationLink {
                                MyOrdersView()
                            } label: {
                                AccountRow(title: "My Orders", icon: "shop_bag")
                            }
                            
                            NavigationLink {
                                MyDetailsView()
                            } label: {
                                AccountRow(title: "My Details", icon: "profile_detail")
                            }
                            
                            NavigationLink {
                                DeliveryAddressView()
                            } label: {
                                AccountRow(title: "Delivery Address", icon: "marker")
                            }
                            
                            NavigationLink {
                                PaymentMethodsView()
                            } label: {
                                AccountRow(title: "Payment Methods", icon: "credit_card")
                            }
                            
                            NavigationLink {
                                PromoCodeView()
                            } label: {
                                AccountRow(title: "Promo Code", icon: "promo_code")
                            }
                            
                            
                        }
                        
                        VStack {
                            NavigationLink {
                                NotificationView()
                            } label: {
                                AccountRow(title: "Notifications", icon: "notification")
                            }
                            
                            AccountRow(title: "Help", icon: "help")
                            
                            AccountRow(title: "Info", icon: "info")
                        }
                        
                        Button {
                            MainViewModel.shared.logout()
                        } label: {
                            ZStack {
                                Text("Log Out")
                                    .font(.customfont(.bold, fontSize: 24))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                
                                HStack{
                                    Spacer()
                                    Image("logout")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.white)
                                        .padding(.trailing, 20)
                                }
                            }
                            
                        }
                        .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight:60 )
                        .background(Color.ButtonCol)
                        .cornerRadius(15)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 15)
                        
                    }
                    .padding(.top, 20)
                }
                
                Spacer()
                
                
                
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        AccountView()
    }
    
}
