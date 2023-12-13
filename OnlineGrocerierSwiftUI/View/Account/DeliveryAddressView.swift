//
//  DeliveryAddressView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 04.02.2024.
//

import SwiftUI

struct DeliveryAddressView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var addressVM = DeliveryAddressViewModel.shared
    
    @State var isPicker: Bool = false
    var didSelect: ((_ obj: AddressModel) -> () )?
    
    var body: some View {
        ZStack {
            
            ScrollView {
                LazyVStack(spacing: 15) {
                    ForEach(addressVM.listArr, id: \.id , content: {
                        aObj in
                        
                        HStack(spacing: 15) {
                            VStack {
                                HStack {
                                    Text(aObj.name)
                                        .font(.customfont(.bold, fontSize: 14))
                                        .foregroundColor(.primaryText)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    
                                    Text(aObj.typeName)
                                        .font(.customfont(.bold, fontSize: 14))
                                        .foregroundColor(.primaryText)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 2)
                                        .background(Color.secondaryText.opacity(0.3))
                                        .cornerRadius(5)
                                }
                                
                                Text("\(aObj.city), \(aObj.state), \(aObj.address), \(aObj.postalCode)")
                                    .font(.customfont(.medium, fontSize: 14))
                                    .foregroundColor(.primaryText)
                                    .multilineTextAlignment(.leading)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                                Text(aObj.phone)
                                    .font(.customfont(.bold, fontSize: 14))
                                    .foregroundColor(.secondaryText)
                                    .padding(.vertical, 8)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                            }
                            
                            VStack {
                                
                                Spacer()
                                NavigationLink {
                                    AddDeliveryAddressView(isEdit: true, editObj: aObj)
                                } label: {
                                    Image(systemName: "pencil")
                                        .resizable()
                                        .foregroundColor(.darkGray)
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                }
                                .padding(.bottom, 8)
                                
                                
                                Button {
                                    addressVM.serviceCallRemove(cObj: aObj)
                                } label: {
                                    Image("cancel")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                }
                                
                                Spacer()

                            }
                        }
                        .padding(15)
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(color: Color.black.opacity(0.15), radius: 2)
                        .onTapGesture {
                            if(isPicker){
                                mode.wrappedValue.dismiss()
                                didSelect?(aObj)
                            }
                        }
                        
                    })
                    .padding(15)
                }
                
            }
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
                        
                        Text("Delivery Address")
                            .font(.customfont(.bold, fontSize: 20))
                            .foregroundColor(.primaryText)
                            .frame(height: 40)
                            .padding(.leading, -10)
                        Spacer()
                        
                        NavigationLink {
                            AddDeliveryAddressView(isEdit: false)
                        } label: {
                            Image("plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                        }
                        
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
    NavigationView {
        DeliveryAddressView()
    }
    
}
