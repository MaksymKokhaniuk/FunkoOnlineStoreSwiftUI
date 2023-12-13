//
//  RoundButton2.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 30.12.2023.
//

import SwiftUI

struct RoundButton2: View {
    
    @State var title: String = "Title"
    var didTap: (()->())?
    
    var body: some View {
        Button {
            didTap?()
        } label: {
            Text(title)
                .font(.customfont(.bold, fontSize: 24))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame( minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60 )
        .background(Color.ButtonCol)
        .cornerRadius(15)
    }
}

#Preview {
    RoundButton2()
        .padding(25)
}
