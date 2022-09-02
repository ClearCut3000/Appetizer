//
//  AccountView.swift
//  Appetizer
//
//  Created by Николай Никитин on 30.08.2022.
//

import SwiftUI

struct AccountView: View {

  //MARK: - View Poperties
  @State private var firstName = ""
  @State private var lastName = ""
  @State private var eMail = ""
  @State private var birthdate = Date()
  @State private var extraNapkins = false
  @State private var frequentRefills = false

  //MARK: - View Body
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Personal Info")) {
          TextField("First Name...", text: $firstName)
          TextField("Last Name...", text: $lastName)
          TextField("E-mail...", text: $eMail)
            .keyboardType(.emailAddress)
            .textInputAutocapitalization(.none)
            .disableAutocorrection(true)
          DatePicker("Birthdate",
                     selection: $birthdate,
                     displayedComponents: .date)
          Button {

          } label: {
            Text("Save")
          }
        }
        Section(header: Text("Requests")) {
          Toggle("Extra Napkins", isOn: $extraNapkins)
          Toggle("Frequent Refills", isOn: $frequentRefills)
        }
        .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
      }
      .navigationTitle("Account")
    }
  }
}

struct AccountView_Previews: PreviewProvider {
  static var previews: some View {
    AccountView()
  }
}
