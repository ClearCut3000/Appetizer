//
//  OrderView.swift
//  Appetizer
//
//  Created by Николай Никитин on 30.08.2022.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
      NavigationView {
        Text("Order View")
          .navigationTitle("Order")
      }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
