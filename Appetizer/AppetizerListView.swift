//
//  AppetizerListView.swift
//  Appetizer
//
//  Created by Николай Никитин on 30.08.2022.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
      NavigationView {
        List(MockData.appetizers) { appetizer in
          AppetizerListCell(appetizer: appetizer)
        }
          .navigationTitle("Appetizers")
      }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
