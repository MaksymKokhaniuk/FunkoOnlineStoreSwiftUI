//
//  TabButton.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 30.01.2024.
//

import SwiftUI

struct TabButton: View {
    
    @State var title: String = "Title"
    @State var icon: String = "shopTab"
    var isSelect: Bool = false
    var didSelect: (() -> ())
    
    var body: some View {
        Button {
            debugPrint("Tab Button Tap")
            didSelect()
        } label: {
            VStack {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                
                Text(title)
                    .font(.customfont(.semibold, fontSize: 14))
            }
        }
        .foregroundColor(isSelect ? .RedCol : .primaryText)
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

#Preview {
    TabButton {
        print("test")
    }
}
