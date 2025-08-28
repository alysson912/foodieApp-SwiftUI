//
//  AppetizeListView.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 21/08/25.
//

import SwiftUI


struct AppetizeListView: View {
    
    @StateObject private var viewModel = AppetizerListViewModel()
    @State private var isShowingDetail = false
    @State private var selectedAppetizer: AppetizerModel?
    
    var body: some View {
        ZStack {
            NavigationStack {
                //MARK:
                List(viewModel.appetizers) { appetizer in
                    AppetizerCell(appetizer: appetizer)
                        .onTapGesture {
                            selectedAppetizer = appetizer
                            isShowingDetail = true
                        }
                }
                
                .navigationTitle("🍟 Appetizers")
                .disabled(isShowingDetail) // disable scroll in subView
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            .blur(radius: isShowingDetail ? 20 : 0) // se for verdadeiro apliquique o blur
            
            if isShowingDetail {
                DetailView(appetizer: selectedAppetizer!, isShowingDetail: $isShowingDetail)
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
