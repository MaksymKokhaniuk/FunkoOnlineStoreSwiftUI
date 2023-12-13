//
//  FavoriteRow.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 01.02.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavoriteRow: View {
    @State var fObj: ProductModel = ProductModel(dict: [:])
    
    var body: some View {
        NavigationLink{
            ProductDetailView(detailVM: ProductDetailViewModel(prodObj: fObj))
        } label: {
            VStack {
                HStack {
                    WebImage(url: URL(string: fObj.image ))
                        .resizable()
                        .indicator(.activity)
                        .transition(.fade(duration: 0.5))
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    VStack {
                        Text(fObj.name)
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 3)
                        
                        Text("Licence: \(fObj.brandName)")
                            .font(.customfont(.bold, fontSize: 13))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 8)
                        
                        HStack {
                            Text("$\(fObj.offerPrice ?? fObj.price, specifier: "%.2f")")
                                .font(.customfont(.bold, fontSize: 16))
                                .foregroundColor(.primaryText)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    Image("next")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                }
            }
            .frame(width: 400, height: 100)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.primaryText, lineWidth: 1)
            )
        }

    }
}

#Preview {
    FavoriteRow()
}
