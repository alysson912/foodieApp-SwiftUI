//
//  AppetizerCell.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 22/08/25.
//

import SwiftUI

struct AppetizerCell: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            ImageLoaderView()
                .frame(width: 120, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack (alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerCell(appetizer: MockData.sampleAppetizer)
}
