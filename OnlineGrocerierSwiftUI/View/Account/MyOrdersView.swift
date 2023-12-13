//
//  MyOrdersView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 07.02.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyOrdersView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var myVM = MyOrdersViewModel.shared
    
    var body: some View {
        ZStack {
            
            ScrollView {
                LazyVStack(spacing: 5) {
                    ForEach(myVM.listArr, id: \.id , content: {
                        myObj in
                        
                        NavigationLink {
                            MyOrdersDetailView(detailVM: MyOrderDetailViewModel(prodObj: myObj))
                        } label: {
                            VStack {
                                HStack {
                                    
                                    Text("Order No: #")
                                        .font(.customfont(.bold, fontSize: 16))
                                        .foregroundColor(.primaryText)
                                    
                                    Text("\(myObj.id)")
                                        .font(.customfont(.bold, fontSize: 16))
                                        .foregroundColor(.primaryText)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    
                                    Text(getOrderStatus(mObj: myObj))
                                        .font(.customfont(.bold, fontSize: 16))
                                        .foregroundColor(getOrderStatusColor(mObj: myObj))
                                }
                                
                                Text(myObj.createdDate.displayDate(format: "yyyy-MM-dd hh:mm a"))
                                    .font(.customfont(.bold, fontSize: 12))
                                    .foregroundColor(.secondaryText)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                                HStack {
                                    
                                    if let imageUrl = myObj.images.first {
                                        WebImage(url: URL(string: imageUrl ))
                                            .resizable()
                                            .indicator(.activity) // Activity Indicator
                                            .transition(.fade(duration: 0.5))
                                            .scaledToFit()
                                            .frame(width: 60, height: 60)
                                    }
                                    
                                    VStack {
                                        HStack {
                                            
                                            Text("Items:")
                                                .font(.customfont(.bold, fontSize: 16))
                                                .foregroundColor(.primaryText)
                                            
                                            Text(myObj.names ?? "")
                                                .font(.customfont(.medium, fontSize: 14))
                                                .foregroundColor(.secondaryText)
                                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                        }
                                        
                                        HStack {
                                            
                                            Text("Delivery Type:")
                                                .font(.customfont(.bold, fontSize: 16))
                                                .foregroundColor(.primaryText)
                                            
                                            Text(self.getDeliveryType(mObj: myObj))
                                                .font(.customfont(.medium, fontSize: 14))
                                                .foregroundColor(.secondaryText)
                                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                            
                                        }
                                        
                                        HStack {
                                            
                                            Text("Payment Type:")
                                                .font(.customfont(.bold, fontSize: 16))
                                                .foregroundColor(.primaryText)
                                            
                                            Text(getPaymentType(mObj: myObj))
                                                .font(.customfont(.medium, fontSize: 14))
                                                .foregroundColor(.secondaryText)
                                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                            
                                        }
                                        
                                        HStack {
                                            
                                            Text("Payment Status:")
                                                .font(.customfont(.bold, fontSize: 16))
                                                .foregroundColor(.primaryText)
                                            
                                            Text(getPaymentStatus(mObj: myObj))
                                                .font(.customfont(.medium, fontSize: 14))
                                                .foregroundColor( getPaymentStatusColor(mObj: myObj) )
                                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                            
                                        }
                                    }
                                }
                            }
                        }
                        .padding(15)
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(color: Color.black.opacity(0.15), radius: 2)
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
                        
                    Text("My Orders")
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
        .onAppear{
            
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()

    }
    
    func getOrderStatus(mObj: MyOrderModel) -> String {
        switch mObj.orderStatus {
        case 1:
            return "Placed";
        case 2:
            return "Accepted";
        case 3:
            return "Delivered";
        case 4:
            return "Cancel";
        case 5:
            return "Declined";
        default:
            return "";
        }
    }
    
    func getDeliveryType(mObj: MyOrderModel) -> String {
        switch mObj.deliverType {
        case 1:
            return "Delivery";
        case 2:
            return "Collection";
        default:
            return "";
        }
    }
    
    func getPaymentType(mObj: MyOrderModel) -> String {
        switch mObj.paymentType {
        case 1:
            return "Cash On Delivery";
        case 2:
            return "Online Card Payment";
        default:
            return "";
        }
    }
    
    func getPaymentStatus(mObj: MyOrderModel) -> String {
        switch mObj.paymentStatus {
        case 1:
            return "Processing";
        case 2:
            return "Success";
        case 3:
            return "Fail";
        case 4:
            return "Refunded";
        default:
            return "";
        }
    }
    
    func getPaymentStatusColor(mObj: MyOrderModel) -> Color {
        if(mObj.paymentStatus == 1) {
            return Color.orange;
        }
        
        switch mObj.paymentStatus {
        case 1:
            return Color.blue;
        case 2:
            return Color.green;
        case 3:
            return Color.red;
        case 4:
            return Color.green;
        default:
            return Color.white;
        }
    }
    
    func getOrderStatusColor(mObj: MyOrderModel) -> Color {
        switch mObj.orderStatus {
        case 1:
            return Color.blue;
        case 2:
            return Color.green;
        case 3:
            return Color.green;
        case 4:
            return Color.red;
        case 5:
            return Color.red;
        default:
            return Color.primaryApp;
        }
    }
}

#Preview {
    NavigationView {
        MyOrdersView()
    }
}
