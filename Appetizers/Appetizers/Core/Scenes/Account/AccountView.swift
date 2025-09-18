//
//  AccountView.swift
//  Appetizers
//
//  Created by ALYSSON MENEZES on 21/08/25.
//

import SwiftUI

enum FormTextField {
    case firstName, lastName, email
}

struct AccountView: View {
    
    @StateObject private var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    
    var body: some View {
        NavigationStack {
            
            Form {
                Section("Personal Info") {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .lastName} // navegacao p/ proxima textField
                        .submitLabel(.next)
                        .autocorrectionDisabled()
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .autocorrectionDisabled()
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit {focusedTextField = .email}
                        .submitLabel(.next)
                    
                    
                    TextField("e-mail!", text: $viewModel.user.email)
                        .autocorrectionDisabled()
                        .focused($focusedTextField, equals: .email)
                        .onSubmit {focusedTextField = nil} // caso nao tenha o proximo baixe o teclado
                        .submitLabel(.continue)
                    
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                    
                    
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
                //Dismiss Keyboard
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        
                        Button("Dismiss") { focusedTextField = nil }
                            .fontWeight(.semibold)
                    }
                    
                }
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
