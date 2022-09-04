//
//  AppetizerListViewModel.swift
//  Appetizer
//
//  Created by Николай Никитин on 31.08.2022.
//

import Foundation

@MainActor final class AppetizerListViewViewModel: ObservableObject {

  //MARK: - Properties
  @Published var appetizers: [Appetizer] = []
  @Published var alertItem: AlertItem?
  @Published var isLoading = false
  @Published var isShowingDetail = false
  @Published var selectedAppetizer: Appetizer?

  //MARK: - Methods
  func getAppetizers() {
    isLoading = true
    Task {
      do {
        appetizers = try await NetworkManager.shared.getAppetizers()
        isLoading = false
      } catch {
        if let apError = error as? APError {
          switch apError {
          case .invalidURL:
            alertItem = AlertContext.invalidURL
          case .invalidResponse:
            alertItem = AlertContext.invalidResponse
          case .invalidData:
            alertItem = AlertContext.invalidData
          case .unableToComplete:
            alertItem = AlertContext.unableToComplete
          }
        } else {
          alertItem = AlertContext.invalidResponse
        }
        isLoading = false
      }
    }
  }
  
  #warning("Old stuff")
  /*
  func getAppetizers() {
    isLoading = true
    NetworkManager.shared.getAppetizers { [self] result in
      DispatchQueue.main.async {
        isLoading = false
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
  */
}
