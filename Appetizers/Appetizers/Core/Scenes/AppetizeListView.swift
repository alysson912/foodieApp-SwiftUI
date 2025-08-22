//
//  AppetizeListView.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 21/08/25.
//

import SwiftUI

struct AppetizeListView: View {
    var body: some View {
            NavigationStack {
                
                List(MockData.appetizers) { appetizer in
                    AppetizerCell(appetizer: appetizer)
                }
                
                
                    .navigationTitle("🍟 Appetizers")
            }
        
    }
}

#Preview {
    AppetizeListView()
}
