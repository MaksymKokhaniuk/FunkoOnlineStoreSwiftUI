//
//  ProductDetailView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 31.01.2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @StateObject var detailVM:ProductDetailViewModel = ProductDetailViewModel(prodObj: ProductModel(dict: [:]) )
    
    var body: some View {
        ZStack {
            
            ScrollView{
                ZStack{
                    VStack {
                        
                        WebImage(url: URL(string: detailVM.pObj.image ))
                            .resizable()
                            .indicator(.activity)
                            .transition(.fade(duration: 0.5))
                            .scaledToFit()
                            .frame(width: 350, height: 350)
                        
                        Rectangle()
                            .frame(width: 370, height: 1)
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    
                }
                .frame(width: .screenWidth, height: .screenWidth * 0.9)
                
                VStack {
                    HStack {
                        Text(detailVM.pObj.name)
                            .font(.customfont(.semibold, fontSize: 24))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Button {
                            detailVM.serviceCallAddRemoveFav()
                        }label: {
                            Image( detailVM.isFav ? "fav" : "favorite" )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                        }
                        .foregroundColor(Color.RedCol)
                        
                    }
                    .padding(.vertical, -20)
                    
                    HStack {
                        Button {
                            detailVM.addSubQTY(isAdd: false)
                        }label: {
                            Image( "minus" )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(10)
                            
                        }
                        
                        Text( "\(detailVM.qty)")
                            .font(.customfont(.semibold, fontSize: 24))
                            .foregroundColor(.primaryText)
                            .multilineTextAlignment(.center)
                            .frame(width: 45, height: 45, alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.primaryText, lineWidth: 1)
                            )
                        
                        Button {
                            detailVM.addSubQTY(isAdd: true)
                        }label: {
                            Image( "plus" )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(10)
                        }
                        
                        Spacer()
                        
                        Text( "$\( (detailVM.pObj.offerPrice ?? detailVM.pObj.price) * Double(detailVM.qty) , specifier: "%.2f" )" )
                            .font(.customfont(.bold, fontSize: 28))
                            .foregroundColor(.primaryText)
                    }
                    .padding(.vertical, 8)
                    .padding(.top, 10)
                    
                    Rectangle()
                        .frame(width: 370, height: 1)
                        .frame(minWidth: 0, maxWidth: .infinity)
                    
                    Text(detailVM.pObj.detail)
                        .font(.customfont(.bold, fontSize: 13))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 8)
                    
                    Rectangle()
                        .frame(width: 370, height: 1)
                        .frame(minWidth: 0, maxWidth: .infinity)
                    
                    HStack {
                        Text("Product Detail")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Button {
                            withAnimation {
                                detailVM.showDetail()
                            }
                        }label: {
                            Image( detailVM.isShowDetail ? "detail_open" : "next" )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .padding(5)
                        }
                        .foregroundColor(Color.RedCol)
                        
                    }
                    
                    
                    if(detailVM.isShowDetail) {
                        
                        Text("Category: \(detailVM.pObj.catName)")
                            .font(.customfont(.bold, fontSize: 13))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 8)
                        
                        Text("Licence: \(detailVM.pObj.brandName)")
                            .font(.customfont(.bold, fontSize: 13))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 8)
                        
                        Text("Product Type: \(detailVM.pObj.typeName)")
                            .font(.customfont(.bold, fontSize: 13))
                            .foregroundColor(.primaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 8)
                    }
                    
                    
                    Rectangle()
                        .frame(width: 370, height: 1)
                        .frame(minWidth: 0, maxWidth: .infinity)
                    
                    RoundButton2(title: "Add to cart") {
                        CartViewModel.serviceCallAddToCart(prodId: detailVM.pObj.prodId, qty: detailVM.qty) { isDone, msg in
                            
                            detailVM.qty = 1
                            
                            self.detailVM.errorMessage = msg
                            self.detailVM.showError = true
                        }
                    }
                        .padding(.vertical, 20)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
            }
            
            
            VStack{
                
                HStack {
                    Button{
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35)
                    }
                    Spacer()
                    
                }
                
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
        }
        .alert(isPresented: $detailVM.showError, content: {
            Alert(title: Text(Globs.AppName), message: Text(detailVM.errorMessage), dismissButton: .default(Text("OK")))
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(detailVM: ProductDetailViewModel(prodObj: ProductModel(dict: [
                "offer_price": 12,
                "start_date": "2023-12-31T22:00:00.000Z",
                "end_date": "2024-03-03T00:41:00.000Z",
                "prod_id": 16,
                "cat_id": 1,
                "brand_id": 2,
                "type_id": 1,
                "name": "SASUKE UCHIHA AMATERAU DSKLSF",
                "detail": "As one of the last surviving members of the Uchiha clan, Sasuke makes it his mission to avenge his people. Sasuke has channeled his First Susano’o and is ready to bring the power of his spectral avatar into battle. Strengthen your Naruto collection with Pop! Sasuke Uchiha and harness your own chakra! Vinyl figure is approximately 4.3-inches tall.",
                "unit_name": "thing",
                "unit_value": "1",
                "nutrition_weight": "200g",
                "price": 12,
                "image": "http://localhost:3001/img/product/20240131020355355SvcBEvfyre.png",
                "cat_name": "Anime & Manga",
                "brand_name": "Naruto Shipuden",
                "type_name": "POP!",
                "is_fav": 1
        ])))
    }
}
