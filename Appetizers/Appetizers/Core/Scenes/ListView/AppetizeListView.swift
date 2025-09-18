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
                
                List(viewModel.appetizers) { appetizer in
//MARK: Celulas da tableView
                    AppetizerCell(appetizer: appetizer)
                        .listRowSeparator(.hidden)
                       // .listRowSeparatorTint(.brandPrimary)
                    
 //MARK: Action ao clicar em 1 celula
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                
                .navigationTitle("🍟 Appetizers")
                .listStyle(.plain)
                .disabled(viewModel.isShowingDetail) // disable scroll in subView
            }
            .task {
                viewModel.getAppetizers()
            }
            
            .blur(radius: viewModel.isShowingDetail ? 20 : 0) // se for verdadeiro apliquique o blur
            
            if viewModel.isShowingDetail {
                DetailView(appetizer: viewModel.selectedAppetizer!, isShowingDetail: $viewModel.isShowingDetail)
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
