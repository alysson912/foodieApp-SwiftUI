//
//  APButton.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 29/08/25.
//

import SwiftUI

struct OrderButton: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundStyle(.white)
            .background(Color.brandPrimary)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    OrderButton(title: "Teste")
}
