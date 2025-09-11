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
        
    @EnvironmentObject var order: Order
    
    var body: some View {
        
        TabView {
            AppetizeListView()
                .tabItem { Label("Home", systemImage: "house") }
            
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
            
            OrderView()
                .tabItem { Label("Order", systemImage: "bag") }
                .badge(order.items.count)
        }
        
    }
    
}


#Preview {
    AppetizerTabView()
        .environmentObject(Order())
}
