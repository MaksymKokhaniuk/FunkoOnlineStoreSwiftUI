//
//  AddDeliveryAddressView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 04.02.2024.
//

import SwiftUI

struct AddDeliveryAddressView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var addressVM = DeliveryAddressViewModel.shared
    @State var isEdit: Bool = false
    @State var editObj: AddressModel?
    
    var body: some View {
        ZStack {
            
            ScrollView {
                VStack(spacing: 15) {
                    
                    HStack {
                        
                        Button{
                            addressVM.txtTypeName = "Home"
                        } label: {
                            Image(systemName: addressVM.txtTypeName == "Home" ? "record.circle" : "circle")
                            
                            Text("Home")
                                .font(.customfont(.medium, fontSize: 16))
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        }
                        .foregroundColor(.primaryText)
                        
                        Button{
                            addressVM.txtTypeName = "Office"
                        } label: {
                            Image(systemName: addressVM.txtTypeName == "Office" ? "record.circle" : "circle")
                            
                            Text("Office")
                                .font(.customfont(.medium, fontSize: 16))
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        }
                        .foregroundColor(.primaryText)
                        
                    }
                    
                    LineTextField(title: "Name", placeholder: "Enter your name" , txt: $addressVM.txtName, keyboardType: .numberPad)
                    
                    LineTextField(title: "Mobile", placeholder: "Enter your mobile number" , txt: $addressVM.txtMobile)
                    
                    LineTextField(title: "Address", placeholder: "Enter your address" , txt: $addressVM.txtAddress)
                    
                    HStack {
                        LineTextField(title: "City", placeholder: "Enter your city" , txt: $addressVM.txtCity)
                        
                        LineTextField(title: "State", placeholder: "Enter your state" , txt: $addressVM.txtState)
                    }
                    
                    
                    LineTextField(title: "Postal Code", placeholder: "Enter your postal code" , txt: $addressVM.txtPostalCode)
                    
                    RoundButton2(title: isEdit ? "Update Address" : "Add Address") {
                        if(isEdit) {
                            addressVM.serviceCallUpdateAddress(aObj: editObj) {
                                self.mode.wrappedValue.dismiss()
                            }
                        }else {
                            addressVM.serviceCallAddAddress {
                                self.mode.wrappedValue.dismiss()
                            }
                        }
                    }
                    
                }
            }
            .padding(20)
            .padding(.top, .topInsets + 55)
            
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
                    
                    Text(isEdit ? "Edit Delivery Address" : "Add Delivery Address")
                        .font(.customfont(.bold, fontSize: 20))
                        .foregroundColor(.primaryText)
                        .frame(height: 40)
                        .padding(.leading, -35)
                    Spacer()
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                Spacer()
            }
        }
        .onAppear {
            if(isEdit) {
                if let aObj = editObj {
                    addressVM.setData(aObj: aObj)
                }
            }
        }
        .alert(isPresented: $addressVM.showError) {
            Alert(title: Text(Globs.AppName), message: Text(addressVM.errorMessage), dismissButton: .default(Text("OK")))
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    AddDeliveryAddressView()
}
