//
//  AppetizeListViewModel.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 26/08/25.
//

import Foundation


final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    
    /*
     //MARK: Usamos o @Published em variáveis dentro da ViewModel para notificar automaticamente a interface (View) sempre que o valor da variável mudar.
     
     * Quando você marca uma variável com @Published, você está dizendo:
     “Se essa variável mudar, avise todos que estão observando essa classe.”
     
     */
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { [self] result in
            DispatchQueue.main.async { [self] in
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    switch error {
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
