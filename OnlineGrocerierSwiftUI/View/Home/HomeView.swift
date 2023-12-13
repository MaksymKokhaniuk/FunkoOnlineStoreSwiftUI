//
//  HomeView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 29.01.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeVM = HomeViewModel.shared
    var body: some View {
        ZStack {
            VStack {
                Image("funko_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                Spacer()
            }
            .padding(.top, 40)
                
            ScrollView {
                Image("bannerSukuna")
                    .resizable()
                    .scaledToFill()
                    .padding(.horizontal, 20)
                
                SectionTitleAll(title: "Popular", titleAll: "See more") {
                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 15) {
                        ForEach (homeVM.offerArr, id: \.id) {
                            pObj in
                            
                            ProductCell(pObj: pObj, didAddCart: {
                                CartViewModel.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, msg in
                                    
                                    self.homeVM.errorMessage = msg
                                    self.homeVM.showError = true
                                }
                            })
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                }
                
                SectionTitleAll(title: "Best Selling", titleAll: "See more") {
                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 15) {
                        ForEach (homeVM.bestArr, id: \.id) {
                            pObj in
                            
                            ProductCell(pObj: pObj, didAddCart: {
                                CartViewModel.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, msg in
                                    
                                    self.homeVM.errorMessage = msg
                                    self.homeVM.showError = true
                                }
                            })
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                }
                
                SectionTitleAll(title: "Category", titleAll: "See more") {
                    
                }
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 15) {
                        ForEach (homeVM.typeArr, id: \.id) {
                            tObj in
                            
                            CategoryCell(tObj: tObj){
                                
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                }
                .padding(.bottom, 8)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 15) {
                        ForEach (homeVM.listArr, id: \.id) {
                            pObj in
                            
                            ProductCell(pObj: pObj, didAddCart: {
                                CartViewModel.serviceCallAddToCart(prodId: pObj.prodId, qty: 1) { isDone, msg in
                                    
                                    self.homeVM.errorMessage = msg
                                    self.homeVM.showError = true
                                }
                            })
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
                }
                .padding(.bottom, 30)
            }
            .padding(.top, .topInsets + 45)
        }
        .alert(isPresented: $homeVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(homeVM.errorMessage), dismissButton: .default(Text("OK")))
        })
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        HomeView()
    }
}
