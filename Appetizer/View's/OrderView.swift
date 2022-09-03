//
//  OrderView.swift
//  Appetizer
//
//  Created by Николай Никитин on 30.08.2022.
//

import SwiftUI

struct OrderView: View {

  //MARK: - View Properties
  @EnvironmentObject var order: Order

  //MARK: - View Body
  var body: some View {
    NavigationView {
      ZStack {
        VStack {
          List {
            ForEach(order.items) { appetizer in
              AppetizerListCell(appetizer: appetizer)
            }
            .onDelete(perform: order.delete )
          }
          .listStyle(PlainListStyle())

          Button {

          } label: {
            APButton(title: "$\(order.totalPrice, specifier: "%.2f")Place Order")
          }
          .padding(.bottom, 25)
        }
        if order.items.isEmpty {
          EmptyStateView(imageName: "list", message: "You have no items in order. \nTry to add some appetizers!")
        }
      }
      .navigationTitle("Order")
    }
  }
}

struct OrderView_Previews: PreviewProvider {
  static var previews: some View {
    OrderView()
  }
}
