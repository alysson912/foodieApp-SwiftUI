//
//  AccountView.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 21/08/25.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject private var viewModel = AccountViewModel()

    
    var body: some View {
        NavigationStack {
            
            Form {
                Section("Personal Info") {
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("e-mail!", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    DatePicker("Birthday", selection: $viewModel.user.birthdate, displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                        
                    } label: {
                        Text("Save Changes")
                    }
                }
                
                Section("Requests") {
                    Toggle("Extra Mapkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("frequentRefills", isOn: $viewModel.user.frequentRefills)
                    
                }
                // iOS 15- .toggleStyle((SwitchToggleStyle(tint: .brandPrimary)))
                    .tint(.brandPrimary) // iOS 16+
            }
                .navigationTitle("👤 AccountView")
        }
        .onAppear {
            viewModel.retrieveUser()
        }
        
        .alert(item: $viewModel.alertItem){ alertItem in
            Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)}
    }
}

#Preview {
    AccountView()
}
