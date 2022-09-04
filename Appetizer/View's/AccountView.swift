//
//  AccountView.swift
//  Appetizer
//
//  Created by Николай Никитин on 30.08.2022.
//

import SwiftUI

struct AccountView: View {

  //MARK: - View Poperties
  @StateObject var viewModel = AccounViewModel()
  @FocusState private var focusedTextField: FormTextField?

  enum FormTextField {
    case firstName, lastName, email
  }

  //MARK: - View Body
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Personal Info")) {
          TextField("First Name...", text: $viewModel.user.firstName)
            .focused($focusedTextField, equals: .firstName)
            .onSubmit { focusedTextField = .lastName }
            .submitLabel(.next)
          TextField("Last Name...", text: $viewModel.user.lastName)
            .focused($focusedTextField, equals: .lastName)
            .onSubmit { focusedTextField = .email }
            .submitLabel(.next)
          TextField("E-mail...", text: $viewModel.user.eMail)
            .focused($focusedTextField, equals: .email)
            .onSubmit { focusedTextField = nil }
            .submitLabel(.continue)
            .keyboardType(.emailAddress)
            .textInputAutocapitalization(.none)
            .disableAutocorrection(true)
          DatePicker("Birthdate",
                     selection: $viewModel.user.birthdate,
                     displayedComponents: .date)
          Button {
            viewModel.saveChanges()
          } label: {
            Text("Save")
              .frame(maxWidth: .infinity, alignment: .center)
          }
        }
        Section(header: Text("Requests")) {
          Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
          Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
        }
        .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
      }
      .navigationTitle("Account")
      .toolbar {
        ToolbarItemGroup(placement: .keyboard) {
          Button("Dismiss") { focusedTextField = nil }
        }
      }
    }
    .onAppear{
      viewModel.retriveUser()
    }
    .alert(item: $viewModel.alertItem) { alertItem in
      Alert(title: alertItem.title,
            message: alertItem.message,
            dismissButton: alertItem.dismissButton)
    }
  }
}

struct AccountView_Previews: PreviewProvider {
  static var previews: some View {
    AccountView()
  }
}
