//
//  ExploreView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 29.01.2024.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var exploreVM = ExploreViewModel.shared
    
    var colums = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        ZStack {
            
            VStack {
                HStack {
                    Spacer()
                    Text("Category")
                        .font(.customfont(.bold, fontSize: 20))
                        .foregroundColor(.primaryText)
                        .frame(height: 50)
                    Spacer()
                    
                }
                .padding(.top, .topInsets)
                
                ScrollView{
                    LazyVGrid(columns: colums, spacing: 15){
                        ForEach(exploreVM.listArr, id: \.id) {
                            cObj in
                            
                            NavigationLink(destination: ExploreItemsView(itemsVM: ExploreItemViewModel(catObj: cObj) ) ){
                                ExploreCategoryCell(cObj: cObj)
                                    .aspectRatio(0.95, contentMode: .fill)
                            }
                            }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .padding(.bottom, .bottomInsets + 60)
                }
                
                Spacer()
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ExploreView()
}
