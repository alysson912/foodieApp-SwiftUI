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
    
   // @State private var selectedTab: TabIdentifier = .home
    @EnvironmentObject var order: Order
    
    var body: some View {
        
      
                
                TabView {
                    // Tab("Home", systemImage: "house", value: TabIdentifier.home) { iOS 18+
                    AppetizeListView()
                        .tabItem { Label("Home", systemImage: "house") }
                    //  }
                    
                    //  Tab("Account", systemImage: "person.fill", value: TabIdentifier.account) {
                    AccountView()
                        .tabItem { Label("Account", systemImage: "person") }
                
                
                //   Tab("Order", systemImage: "bag", value: TabIdentifier.home) {
                OrderView()
                    .tabItem { Label("Order", systemImage: "bag") }
                    .badge(order.items.count)
            }
        
        }
        
}
        //        .tabViewStyle(.automatic)
        //        .tint(.brandPrimary)


        


#Preview {
    AppetizerTabView()
        .environmentObject(Order())
}
