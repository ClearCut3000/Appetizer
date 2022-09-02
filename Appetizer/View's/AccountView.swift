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

  //MARK: - View Body
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Personal Info")) {
          TextField("First Name...", text: $viewModel.firstName)
          TextField("Last Name...", text: $viewModel.lastName)
          TextField("E-mail...", text: $viewModel.eMail)
            .keyboardType(.emailAddress)
            .textInputAutocapitalization(.none)
            .disableAutocorrection(true)
          DatePicker("Birthdate",
                     selection: $viewModel.birthdate,
                     displayedComponents: .date)
          Button {
            viewModel.saveChanges()
          } label: {
            Text("Save")
          }
        }
        Section(header: Text("Requests")) {
          Toggle("Extra Napkins", isOn: $viewModel.extraNapkins)
          Toggle("Frequent Refills", isOn: $viewModel.frequentRefills)
        }
        .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
      }
      .navigationTitle("Account")
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
