//
//  MainTabView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 29.01.2024.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject var homeVM = HomeViewModel.shared
    
    var body: some View {
        VStack {
            if(homeVM.selectTab == 0) {
                HomeView()
            }else if(homeVM.selectTab == 1) {
                ExploreView()
            }else if(homeVM.selectTab == 2) {
                MyCartView()
            }else if(homeVM.selectTab == 3) {
                FavouriteView()
            }else if(homeVM.selectTab == 4) {
                AccountView()
            }
            
            HStack {
                
                TabButton(title: "Shop", icon: "shopTab", isSelect: homeVM.selectTab == 0) {
                    print("button")
                    DispatchQueue.main.async {
                        withAnimation {
                            homeVM.selectTab = 0
                        }
                    }
                }
                TabButton(title: "Explore", icon: "exploreTab", isSelect: homeVM.selectTab == 1) {
                    DispatchQueue.main.async {
                        withAnimation {
                            homeVM.selectTab = 1
                        }
                    }
                }
                TabButton(title: "Cart", icon: "cartTab", isSelect: homeVM.selectTab == 2) {
                    DispatchQueue.main.async {
                        withAnimation {
                            homeVM.selectTab = 2
                        }
                    }
                }
                TabButton(title: "Favorite", icon: "favoriteTab", isSelect: homeVM.selectTab == 3) {
                    DispatchQueue.main.async {
                        withAnimation {
                            homeVM.selectTab = 3
                        }
                    }
                }
                TabButton(title: "Profile", icon: "profileTab", isSelect: homeVM.selectTab == 4) {
                    DispatchQueue.main.async {
                        withAnimation {
                            homeVM.selectTab = 4
                        }
                    }
                }
            }
            .padding(.top, 10)
            .padding(.bottom, 25)
            .padding(.horizontal, 10)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: -2)
            
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    MainTabView()
}
