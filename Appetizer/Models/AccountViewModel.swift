//
//  AccountViewModel.swift
//  Appetizer
//
//  Created by Николай Никитин on 02.09.2022.
//

import SwiftUI

final class AccounViewModel: ObservableObject {

  //MARK: - Properties
  @Published var firstName = ""
  @Published var lastName = ""
  @Published var eMail = ""
  @Published var birthdate = Date()
  @Published var extraNapkins = false
  @Published var frequentRefills = false
  @Published var alertItem: AlertItem?

  var isValidForm: Bool {
    guard !firstName.isEmpty && !lastName.isEmpty && !eMail.isEmpty else {
      alertItem = AlertContext.invalidForm
      return false
    }
    guard eMail.isValidEmail else {
      alertItem = AlertContext.invalidEmail
      return false
    }
    return true
  }

  //MARK: - Methods
  func saveChanges() {
    guard isValidForm else { return }
    
  }
}
