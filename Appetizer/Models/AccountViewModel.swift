//
//  AccountViewModel.swift
//  Appetizer
//
//  Created by Николай Никитин on 02.09.2022.
//

import SwiftUI

final class AccounViewModel: ObservableObject {

  //MARK: - Properties
  @AppStorage("user") private var userData: Data?
  @Published var user = User()
  @Published var alertItem: AlertItem?

  var isValidForm: Bool {
    guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.eMail.isEmpty else {
      alertItem = AlertContext.invalidForm
      return false
    }
    guard user.eMail.isValidEmail else {
      alertItem = AlertContext.invalidEmail
      return false
    }
    return true
  }

  //MARK: - Methods
  func saveChanges() {
    guard isValidForm else { return }
    do {
      let data = try JSONEncoder().encode(user)
      userData = data
      alertItem = AlertContext.userSaverSuccess
    } catch {
      alertItem = AlertContext.invalidUserData
    }
  }

  func retriveUser() {
    guard let userData = userData else {  return }
    do {
      user = try JSONDecoder().decode(User.self, from: userData)
    } catch {
      alertItem = AlertContext.invalidUserData
    }
  }
}
