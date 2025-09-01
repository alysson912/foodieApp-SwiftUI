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
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Last Name", text: $viewModel.lastName)
                    TextField("e-mail!", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    DatePicker("Birthday", selection: $viewModel.birthdate, displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                        
                    } label: {
                        Text("Save Changes")
                    }
                }
                
                Section("Requests") {
                    Toggle("Extra Mapkins", isOn: $viewModel.extraNapkins)
                    Toggle("frequentRefills", isOn: $viewModel.frequentRefills)
                    
                }
                // iOS 15- .toggleStyle((SwitchToggleStyle(tint: .brandPrimary)))
                    .tint(.brandPrimary) // iOS 16+
            }
                .navigationTitle("👤 AccountView")
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
