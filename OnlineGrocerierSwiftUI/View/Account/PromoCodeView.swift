//
//  PromoCodeView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 05.02.2024.
//

import SwiftUI

struct PromoCodeView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var promoVM = PromoCodeViewModel.shared
    
    @State var isPicker: Bool = false
    var didSelect: ((_ obj: PromoCodeModel) -> () )?
    
    var body: some View {
        
        ZStack {
            ScrollView {
                LazyVStack(spacing: 15) {
                    ForEach(promoVM.listArr, id: \.id , content: {
                        pObj in
                        
                        VStack {
                            HStack() {
                                Text(pObj.title)
                                    .font(.customfont(.bold, fontSize: 14))
                                    .foregroundColor(.primaryText)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                                Text(pObj.code)
                                    .font(.customfont(.bold, fontSize: 14))
                                    .foregroundColor(.RedCol)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 2)
                                    .background(Color.secondaryText.opacity(0.3))
                                    .cornerRadius(5)
                            }
                            
                            Text(pObj.description)
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.primaryText)
                                .multilineTextAlignment(.leading)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            
                            HStack {
                                Text("Expiry Date: ")
                                    .font(.customfont(.bold, fontSize: 14))
                                    .foregroundColor(.secondaryText)
                                    .padding(.vertical, 8)
                                
                                Text(pObj.endDate.displayDate(format: "yyyy-MM-dd hh:mm a"))
                                    .font(.customfont(.bold, fontSize: 12))
                                    .foregroundColor(.secondaryText)
                                    .padding(.vertical, 8)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            }
                            
                        }
                        .padding(15)
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(color: Color.black.opacity(0.15), radius: 2)
                        .onTapGesture {
                            if(isPicker){
                                mode.wrappedValue.dismiss()
                                didSelect?(pObj)
                            }
                        }
                    })
                    .padding(1)
                }
                
            }
            .padding(20)
            .padding(.top, .topInsets + 45)
            .padding(.bottom, .bottomInsets + 45)
            
            VStack {
                HStack {
                    
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35)
                    }
                    
                    Spacer()

                    Text("Promo Code")
                        .font(.customfont(.bold, fontSize: 20))
                        .frame(height: 46)
                        .padding(.leading, -35)
                    Spacer()
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                
                Spacer()
            }
            
        }
        .onAppear{
            
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    PromoCodeView()
}
