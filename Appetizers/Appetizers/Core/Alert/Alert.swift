//
//  Alert.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 26/08/25.
//

import SwiftUI

//struct AlertItem2: Identifiable {
//    let id = UUID()
//    let title: Text
//    let message: Text
//    let dismissButtonTitle: String
//    let isDestructive: Bool
//    let action: (() -> Void)?
//}

//struct AlertItemDois {
//    
//    private let invalidData = AlertItem2(
//        title: Text("Server Error"),
//        message: Text("The data received from the server was invalid. Please contact support."),
//        dismissButtonTitle: "OK",
//        isDestructive: false,
//        action: nil
//    )
//   
//
//}


struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidData =        AlertItem(title: Text("Server Error"),
                                       message: Text("The data received from the server was invalid. Please contact support."),
                                       dismissButton: .default(Text("0K")))
    
    static let invalidResponse =    AlertItem(title: Text("Server Error"),
                                        message: Text("Invalid response from the server. Please try again later or contact support."),
                                        dismissButton: .default(Text("0K")))
    
    static let invalidURL =         AlertItem(title: Text("Server Error"),
                                        message: Text("There was an issue connecting to the server. If this perssists, please contect support."),
                                        dismissButton: .default(Text("OK")))
    
    static let unableToComplete =   AlertItem(title: Text("Server Error"),
                                        message: Text("Unable to complete your request at this time. Please check your internet connection.."),
                                        dismissButton: .default(Text("OK")))
                                            
}
