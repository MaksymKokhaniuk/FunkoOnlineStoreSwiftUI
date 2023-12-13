//
//  FavouriteView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 31.01.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavouriteView: View {
    
    @StateObject var favVM = FavouriteViewModel.shared
    
    var body: some View {
        ZStack {
            
            ScrollView {
                LazyVStack {
                    ForEach(favVM.listArr, id: \.id , content: {
                        fObj in
                        
                        FavoriteRow(fObj: fObj)
                        })
                    .padding(.top, 15)
                }
                
            }
            .padding(.top, .topInsets + 45)
            .padding(.bottom, .bottomInsets + 45)
                VStack {
                    
                    HStack {
                        Spacer()
                        Text("Favorites")
                            .font(.customfont(.bold, fontSize: 20))
                            .foregroundColor(.primaryText)
                            .frame(height: 10)
                        Spacer()
                        
                    }
                    .padding(.top, .topInsets)
                    Spacer()
                    
                    RoundButton2(title: "Add all to cart")
                }
                .padding(20)
            
        }
        .onAppear{
            favVM.serviceCallList()
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}
