//
//  AppetizeModel.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 22/08/25.
//

import Foundation

struct AppetizerModel: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    var imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}


struct AppetizerResponse: Decodable {
    let request: [AppetizerModel]
}


struct MockData {
    
    static let sampleAppetizer = AppetizerModel(id: 0001,
                                           name: "Test Appetizer",
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 9.99,
                                           imageURL: Constants.randomImage,
                                           calories: 919,
                                           protein: 19,
                                           carbs: 349)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItemOne  = AppetizerModel(id: 0001,
                                           name: "Test Appetizer One",
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 59.99,
                                           imageURL: Constants.randomImage,
                                           calories: 929,
                                           protein: 919,
                                           carbs: 9)
    
    static let orderItemTwo  = AppetizerModel(id: 0002,
                                           name: "Test Appetizer Two",
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 39.9,
                                            imageURL: Constants.randomImage,
                                           calories: 219,
                                           protein: 319,
                                           carbs: 91)
    
    static let orderItemThree  = AppetizerModel(id: 0003,
                                           name: "Test Appetizer Three",
                                           description: "This is the description for my appetizer. It's yummy.",
                                           price: 51.99,
                                           imageURL: Constants.randomImage,
                                           calories: 79,
                                           protein: 949,
                                           carbs: 991)
    
    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree]
}
