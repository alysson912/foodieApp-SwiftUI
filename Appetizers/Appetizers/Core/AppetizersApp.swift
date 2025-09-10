//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 21/08/25.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order) //MARK: INJETANDO OBJETO
        }
    }
}
