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

  //MARK: - Methods
  func getAppetizers() {
    NetworkManager.shared.getAppetizers { result in
      DispatchQueue.main.async {
        switch result {
        case .success(let appetizers):
          self.appetizers = appetizers
        case .failure(let error):
          print(error.localizedDescription)
        }
      }
    }
  }
}
