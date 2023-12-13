//
//  OnlineGrocerierSwiftUIApp.swift
//  OnlineGrocerierSwiftUI
//
//  Created by MaxK on 13.12.2023.
//

import SwiftUI

@main
struct OnlineGrocerierSwiftUIApp: App {
    
    @StateObject var mainVM = MainViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            
            NavigationView {
                
                if mainVM.isUserLogin{
                    MainTabView()
                }else {
                    WelcomeView()
                }
            }
        }
    }
}
