//
//  AppetizeListView.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 21/08/25.
//

import SwiftUI


struct AppetizeListView: View {
    
    @StateObject private var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack {
                //MARK:
                List(viewModel.appetizers) { appetizer in
                    AppetizerCell(appetizer: appetizer)
                }
                
                .navigationTitle("🍟 Appetizers")
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(
                    title: alertItem.title,
                    message: alertItem.message,
                    dismissButton: alertItem.dismissButton)
            
        }
    }
 
}

#Preview {
    AppetizeListView()
}
