//
//  EmptyState.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 08/09/25.
//

import SwiftUI

struct OrderEmptyState: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            
            Color(.systemBackground).ignoresSafeArea()
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
            .offset(y: -50)
        }
    }
}

#Preview {
    OrderEmptyState(imageName: "empty-order", message: "Default Message - This is our test message. \n I'm making it a little long for testing")
}
