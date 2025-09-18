//
//  AppetizerCell.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 22/08/25.
//

import SwiftUI

struct AppetizerCell: View {
    let appetizer: AppetizerModel
    
    var body: some View {
        HStack {
            
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
            }
            
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
