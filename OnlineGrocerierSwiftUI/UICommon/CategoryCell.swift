//
//  CategoryCell.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 30.01.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategoryCell: View {
    @State var tObj: TypeModel = TypeModel(dict: [ : ])
    @State var color: Color = Color.yellow
    
    var didAddCart: (()->())?
    
    var body: some View {
        HStack {
            
            WebImage(url: URL(string: tObj.image ))
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 70, height: 70)
            
            Text(tObj.name)
                .font(.customfont(.bold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        }
        .padding(15)
        .frame(width: 250, height: 100)
        .background( tObj.color.opacity(0.3))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.primaryText, lineWidth: 1)
        )

    }
}

#Preview {
    CategoryCell(tObj: TypeModel(dict: ["type_id": 1,
                                 "type_name": "POP!",
                                 "image": "http://localhost:3001/img/type/202401272331303130tbSwwpZ0se.png",
                                 "color": "FFFFFF"]))
}
