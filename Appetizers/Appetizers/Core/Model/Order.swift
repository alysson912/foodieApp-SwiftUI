//
//  OrderModel.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 10/09/25.
//

import Foundation

final class Order: ObservableObject {
    
    @Published var items: [AppetizerModel] = []
    
    func add(_ appetizer: AppetizerModel) {
        items.append(appetizer)
    }
    
    func deleteItems(at offesets: IndexSet) {
        items.remove(atOffsets: offesets)
    }
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price}
    }
}
