//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 01/09/25.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    
    
    //MARK: SALVANDO USER COM AppStorage iOS 14+
    
    func saveChanges() {
        guard isValidForm else { return } // verificando se o form é valido
        
        do {
            let data = try JSONEncoder().encode(user) // CODIFICANDO  user para depois salvar como dados
            userData = data
            alertItem = AlertContext.userSaveSuccess // alert success
        } catch {
            alertItem = AlertContext.invalidUserData // alert error
        }
    }
    
    //MARK: RECUPERANDO DADOS SALVOS
    
    func retrieveUser() {
        guard let userData = userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true 
    }
    
  
}
