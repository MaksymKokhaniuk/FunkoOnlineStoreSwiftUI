//
//  NotificationView.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 07.02.2024.
//

import SwiftUI

struct NotificationView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var notiVM = NotificationViewModel.shared
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack(spacing: -15) {
                    ForEach(notiVM.listArr, id: \.id , content: {
                        nObj in
                        
                        VStack {
                            HStack {
                                Text(nObj.title)
                                    .font(.customfont(.bold, fontSize: 14))
                                    .foregroundColor(.primaryText)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                                Text(nObj.createdDate.displayDate(format: "yyyy-MM-dd hh:mm a"))
                                    .font(.customfont(.bold, fontSize: 12))
                                    .foregroundColor(.secondaryText)
                            }
                            
                            Text(nObj.message)
                                .font(.customfont(.bold, fontSize: 12))
                                .foregroundColor(.secondaryText)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(15)
                        .background( nObj.isRead == 1 ? Color.UnreadMessage : Color.white)
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
                        
                    Text("Notifications")
                        .font(.customfont(.bold, fontSize: 20))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.leading, 25)
                    Spacer()
                        
                    Button {
                        notiVM.serviceCallReadAll()
                    } label: {
                        Text("Read All")
                            .font(.customfont(.bold, fontSize: 16))
                            .foregroundColor(.red)
                    }
                        
                }
                .padding(.top, .topInsets)
                .padding(.horizontal, 20)
                
                Spacer()
            }
        }
        .alert(isPresented: $notiVM.showError) {
            Alert(title: Text(Globs.AppName), message: Text(notiVM.errorMessage), dismissButton: .default(Text("OK")))
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()

    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
