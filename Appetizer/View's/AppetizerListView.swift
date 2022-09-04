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
    ZStack {
      NavigationView {
        List(viewModel.appetizers) { appetizer in
          AppetizerListCell(appetizer: appetizer)
            .onTapGesture {
              viewModel.selectedAppetizer = appetizer
              viewModel.isShowingDetail = true
            }
        }
        .navigationTitle("Appetizers")
        .listStyle(.plain)
        .disabled(viewModel.isShowingDetail)
        }
      .task {
        viewModel.getAppetizers()
      }
      .blur(radius: viewModel.isShowingDetail ? 20 : 0)

      if viewModel.isShowingDetail {
        AppetizerDetailView(appetizer: viewModel.selectedAppetizer!,
                            isShowingDetail: $viewModel.isShowingDetail)
      }

      if viewModel.isLoading {
       LoadingView()
      }

    }
    .alert(item: $viewModel.alertItem) { alertItem in
      Alert(title: alertItem.title,
            message: alertItem.message,
            dismissButton: alertItem.dismissButton)
    }
  }
}

struct AppetizerListView_Previews: PreviewProvider {
  static var previews: some View {
    AppetizerListView()
  }
}
