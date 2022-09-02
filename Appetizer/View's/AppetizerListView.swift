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
  @State private var isShowingDetail = false
  @State private var selectedAppetizer: Appetizer?

  //MARK: - View Body
  var body: some View {
    ZStack {
      NavigationView {
        List(viewModel.appetizers) { appetizer in
          AppetizerListCell(appetizer: appetizer)
            .onTapGesture {
              selectedAppetizer = appetizer
              isShowingDetail = true
            }
        }
        .navigationTitle("Appetizers")
        .disabled(isShowingDetail)
        }
      .onAppear {
        viewModel.getAppetizers()
      }
      .blur(radius: isShowingDetail ? 20 : 0)

      if isShowingDetail {
        AppetizerDetailView(appetizer: selectedAppetizer!,
                            isShowingDetail: $isShowingDetail)
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
