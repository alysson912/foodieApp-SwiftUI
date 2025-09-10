//
//  OrderView.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 21/08/25.
//
import SwiftUI


struct OrderView: View {
    
    
    @EnvironmentObject  var order: Order
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems) // delete Cell with scroll
                        
                    }
                    .listStyle(PlainListStyle())
                    
                    
                    Button {
                        print("order placed")
                    } label: {
                        APButton(title: "$99.99 - Place Order")
                    }
                    .padding(.bottom, 25)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order. \n  Please add an appetizer!")
                }
            }
                
                .navigationTitle("📋 OrderView")
            }
                
        }
    
  
     
    }
    
   


#Preview {
    OrderView()
}
