//
//  AccountRow.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 04.02.2024.
//

import SwiftUI

struct AccountRow: View {
    @State var title: String = "Title"
    @State var icon: String = "shop_bag"
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 15) {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                
                Text(title)
                    .font(.customfont(.medium, fontSize: 18))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Image("next")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
            Spacer()
            
        }
        .padding(20)
        .frame(width: 380, height: 50)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.primaryText, lineWidth: 1)
        )
        .padding(.bottom, 10)
    }
}

#Preview {
    AccountRow()
}
