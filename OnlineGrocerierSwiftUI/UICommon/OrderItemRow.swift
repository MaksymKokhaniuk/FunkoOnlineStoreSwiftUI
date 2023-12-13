//
//  OrderItemRow.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 07.02.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct OrderItemRow: View {
    @State var pObj: OrderItemModel = OrderItemModel(dict: [:])
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: pObj.image ))
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            VStack {
                Text(pObj.name)
                    .font(.customfont(.bold, fontSize: 16))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 3)
                
                Text("\(pObj.unitValue) , price")
                    .font(.customfont(.bold, fontSize: 13))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 8)
                
                HStack {
                    Text("QTY: \(pObj.qty)")
                        .font(.customfont(.bold, fontSize: 16))
                        .foregroundColor(.primaryText)
                    
                    Text("×  $\(pObj.itemPrice, specifier: "%.2f")")
                        .font(.customfont(.bold, fontSize: 16))
                        .foregroundColor(.primaryText)
                    
                    Spacer()
                }
            }
            
            Text("$\(pObj.offerPrice ?? pObj.price, specifier: "%.2f")")
                    .font(.customfont(.bold, fontSize: 16))
                    .foregroundColor(.primaryText)
        }
        .padding(15)
        .background(Color.white)
        .cornerRadius(5)
        .shadow(color: Color.black.opacity(0.15), radius: 2)
        .padding(.horizontal, 20)
        .padding(.vertical, 4)
    }
}

#Preview {
    OrderItemRow()
}
