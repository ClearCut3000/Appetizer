//
//  AppetizerListViewModel.swift
//  Appetizer
//
//  Created by Николай Никитин on 31.08.2022.
//

import Foundation

final class AppetizerListViewViewModel: ObservableObject {

  //MARK: - Properties
  @Published var appetizers: [Appetizer] = []
  @Published var alertItem: AlertItem?

  //MARK: - Methods
  func getAppetizers() {
    NetworkManager.shared.getAppetizers { [self] result in
      DispatchQueue.main.async {
        switch result {
        case .success(let appetizers):
          self.appetizers = appetizers
        case .failure(let error):
          switch error {
          case .invalidURL:
            alertItem = AlertContext.invalidURL
          case .invalidResponse:
            alertItem = AlertContext.invalidResponse
          case .invalidData:
            alertItem = AlertContext.invalidData
          case .unableToComplete:
            alertItem = AlertContext.unableToComplete
          }
        }
      }
    }
  }
}
