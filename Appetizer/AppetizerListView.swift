//
//  AppetizerListView.swift
//  Appetizer
//
//  Created by Николай Никитин on 30.08.2022.
//

import SwiftUI

struct AppetizerListView: View {

  //MARK: - View Properties
  @StateObject var viewModel = AppetizerListViewViewModel()

  //MARK: - View Body
  var body: some View {
    NavigationView {
      List(viewModel.appetizers) { appetizer in
        AppetizerListCell(appetizer: appetizer)
      }
      .navigationTitle("Appetizers")
      .onAppear {
        viewModel.getAppetizers()
      }
      .alert(item: $viewModel.alertItem) { alertItem in
        Alert(title: alertItem.title,
              message: alertItem.message,
              dismissButton: alertItem.dismissButton)
      }
    }
  }
}

struct AppetizerListView_Previews: PreviewProvider {
  static var previews: some View {
    AppetizerListView()
  }
}
