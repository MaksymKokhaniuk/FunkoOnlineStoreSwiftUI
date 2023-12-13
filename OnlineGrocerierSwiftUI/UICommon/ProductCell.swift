//
//  ProductCell.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 30.01.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductCell: View {
    @State var pObj: ProductModel = ProductModel(dict: [:])
    
    var didAddCart: (()->())?
    
    var body: some View {
        NavigationLink{
            ProductDetailView(detailVM: ProductDetailViewModel(prodObj: pObj))
        } label: {
            VStack {
                WebImage(url: URL(string: pObj.image ))
                    .resizable()
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                Spacer()
                
                Rectangle()
                    .frame(width: 150, height: 1)
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity)
                
                Text(pObj.name)
                    .font(.customfont(.bold, fontSize: 16))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity)
                
                HStack {
                    Text("$\(pObj.price, specifier: "%.2f")")
                        .font(.customfont(.bold, fontSize: 16))
                        .foregroundColor(.primaryText)
                        .frame(width: 100, height: 30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.primaryText, lineWidth: 1)
                        )
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    Button{
                        didAddCart?()
                    }label: {
                        Image("plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                    .frame(width: 50, height: 30)
                }
                
            }
            .frame(width: 150, height: 230)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.primaryText, lineWidth: 1)
            )
        }
        
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(pObj: ProductModel(dict: [
            "offer_price": 35,
            "start_date": "2023-12-31T22:00:00.000Z",
            "end_date": "2024-03-03T00:41:00.000Z",
            "prod_id": 4,
            "cat_id": 1,
            "brand_id": 1,
            "type_id": 1,
            "name": "MIKASA ACKERMANN WITH THUNDER SPEARS",
            "detail": "The fate of humanity hangs in the balance. Prepare your Attack on Titan collection for battle with Pop! Mikasa Ackermann. She is a skilled swordsman and an essential member to recruit into your regiment. Vinyl figure is approximately 4.3-inches tall.",
            "unit_name": "thing",
            "unit_value": "1",
            "nutrition_weight": "200g",
            "price": 12,
            "image": "http://localhost:3001/img/product/202401272352285228ZMJeVKqxSK.png",
            "cat_name": "Anime & Manga",
            "type_name": "POP!",
            "is_fav": 0
        ]))
    }
}

