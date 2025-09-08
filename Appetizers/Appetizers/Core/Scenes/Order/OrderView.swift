//
//  OrderView.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 21/08/25.
//

import SwiftUI

final class OrderViewModel: ObservableObject {
    @Published  var orderItems = MockData.orderItems
    
    
    
    func deleteItems(at offesets: IndexSet) {
        orderItems.remove(atOffsets: offesets)
    }
}


struct OrderView: View {
    
    @StateObject private var viewModel = OrderViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(MockData.orderItems) { appetizer in
                        AppetizerCell(appetizer: appetizer)
                    }
                    .onDelete(perform: viewModel.deleteItems) // delete Cell with scroll
                    
                }
                .listStyle(PlainListStyle())
                
                
                Button {
                    print("order placed")
                } label: {
                    APButton(title: "$99.99 - Place Order")
                }
                .padding(.bottom, 20)
            }

            .navigationTitle("📋 OrderView")
                
        }
     
    }
    
   
}

#Preview {
    OrderView()
}
