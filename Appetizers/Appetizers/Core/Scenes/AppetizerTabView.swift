//
//  ContentView.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 21/08/25.
//

import SwiftUI

enum TabIdentifier: Hashable {
    case home
    case account
    case profile
}


struct AppetizerTabView: View {
    
    @State private var selectedTab: TabIdentifier = .home

    
    var body: some View {
        
        ZStack {
            
            
            
            
            VStack {
                
                TabView(selection: $selectedTab) {
                    Tab("Home", systemImage: "house", value: TabIdentifier.home) {
                        AppetizeListView()
                            
                    }
                    
                    
                    Tab("Home", systemImage: "person.fill", value: TabIdentifier.account) {
                        AccountView()
                    }
                    
                    Tab("Order", systemImage: "bag", value: TabIdentifier.home) {
                        OrderView()
                    }
                    
                }
                
                .tabViewStyle(.automatic)
                .tint(.brandPrimary)
            }
            
        }
        
            
        
        
    }
}

#Preview {
    AppetizerTabView()
}
