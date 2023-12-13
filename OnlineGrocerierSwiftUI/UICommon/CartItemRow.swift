//
//  CartItemRow.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 03.02.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct CartItemRow: View {
    @State var cObj: CartItemModel = CartItemModel(dict: [:])
    
    var body: some View {
        VStack {
            HStack {
                WebImage(url: URL(string: cObj.image ))
                    .resizable()
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                VStack {
                    HStack {
                        Text(cObj.name)
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            
                            Button {
                                CartViewModel.shared.serviceCallRemove(cObj: cObj)
                            }label: {
                                Image("cancel")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding(10)
                                    
                            }
                    }
                    
                    Text("Licence: \(cObj.brandName)")
                        .font(.customfont(.bold, fontSize: 12))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        Button {
                            CartViewModel.shared.serviceCallUpdateQty(cObj: cObj, newQty: cObj.qty - 1)
                        }label: {
                            Image( "minus" )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.primaryText, lineWidth: 1)
                                )
                                .padding(4)
                            
                        }
                        
                        Text( "\(cObj.qty)")
                            .font(.customfont(.semibold, fontSize: 24))
                            .foregroundColor(.primaryText)
                            .multilineTextAlignment(.center)
                            .frame(width: 45, height: 30, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.primaryText, lineWidth: 1)
                            )
                    
                        
                        Button {
                            CartViewModel.shared.serviceCallUpdateQty(cObj: cObj, newQty: cObj.qty + 1)
                        }label: {
                            Image( "plus" )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.primaryText, lineWidth: 1)
                                )
                                .padding(4)
                        }
                        
                        Spacer()
                        
                        Text("$\(cObj.offerPrice ?? cObj.price, specifier: "%.2f")")
                            .font(.customfont(.bold, fontSize: 20))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity)
                        
                    }
                }
            }
        }
        .frame(width: 400, height: 130)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.primaryText, lineWidth: 1)
        )

    }}

#Preview {
    CartItemRow(cObj: CartItemModel(dict: [
                    "cart_id": 1,
                    "user_id": 3,
                    "prod_id": 15,
                    "qty": 1,
                    "cat_id": 1,
                    "brand_id": 2,
                    "type_id": 1,
                    "name": "SASORI ",
                    "detail": "Prepare for battle with this exclusive Pop! Sasori! This powerful member of the Akatsuki is ready to take his place in your Naruto: Shippuden collection. Vinyl figure is approximately 4-inches tall.",
                    "unit_name": "thing",
                    "unit_value": "1",
                    "nutrition_weight": "200g",
                    "price": 12,
                    "created_date": "2024-01-31T00:02:56.000Z",
                    "modify_date": "2024-01-31T00:02:56.000Z",
                    "cat_name": "Anime & Manga",
                    "is_fav": 0,
                    "brand_name": "Naruto",
                    "type_name": "POP!",
                    "offer_price": 12,
                    "start_date": "",
                    "end_date": "",
                    "is_offer_active": 0,
                    "image": "http://localhost:3001/img/product/20240131020256256wJHQye0Anw.png",
                    "item_price": 12,
                    "total_price": 12]))
    .padding(.horizontal, 20)
}
