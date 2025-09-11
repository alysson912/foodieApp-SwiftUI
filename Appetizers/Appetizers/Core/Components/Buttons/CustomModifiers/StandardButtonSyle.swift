//
//  CustomButton.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 11/09/25.
//

import SwiftUI


struct StandardButtonSyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
        .buttonStyle(.bordered)
        .controlSize(.large)
        .tint(.brandPrimaryColor)
        
    }
}
