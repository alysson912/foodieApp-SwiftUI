//
//  DismissButton.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 29/08/25.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(Color.white)
                .opacity(0.6) // <- DarkMode
            
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundStyle(Color.xMarkButton) // <- DarkMode
            
        }
    }
}

#Preview {
    XDismissButton()
}
