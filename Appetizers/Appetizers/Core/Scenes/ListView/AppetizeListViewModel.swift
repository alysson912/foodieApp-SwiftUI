//
//  AppetizeListViewModel.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 26/08/25.
//

import Foundation


@MainActor final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [AppetizerModel] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    /*
     //MARK: Usamos o @Published em variáveis dentro da ViewModel para notificar automaticamente a interface (View) sempre que o valor da variável mudar.
     
     * Quando você marca uma variável com @Published, você está dizendo:
     “Se essa variável mudar, avise todos que estão observando essa classe.”
     
     */
    
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: AppetizerModel?
    
    //MARK: OLD ALERT
   /*
    func getAppetizers() {
        isLoading = true
        
        NetworkManager.shared.getAppetizers { [self] result in
            DispatchQueue.main.async { [self] in
                isLoading = false
                
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
    } */
    
    func getAppetizers() {
        isLoading = true
        
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case.unableToComplete:
                        alertItem = AlertContext.unableToComplete

                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                
                isLoading = false
            }
        }
    }
}
