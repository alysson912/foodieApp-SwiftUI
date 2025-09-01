//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 01/09/25.
//

import Foundation

final class AccountViewModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthdate: Date = Date()
    @Published var extraNapkins: Bool = false
    @Published var frequentRefills: Bool = true
    
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true 
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        print("Changes have been saved successfully")
    }
}
