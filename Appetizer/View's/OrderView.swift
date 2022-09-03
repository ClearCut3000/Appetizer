//
//  OrderView.swift
//  Appetizer
//
//  Created by Николай Никитин on 30.08.2022.
//

import SwiftUI

struct OrderView: View {

  //MARK: - View Properties
  @State private var order = MockData.mockOrder

  //MARK: - View Body
    var body: some View {
      NavigationView {
        VStack {
          List {
            ForEach(order) { appetizer in
              AppetizerListCell(appetizer: appetizer)
            }
            .onDelete(perform: deleteItems )
          }
          .listStyle(PlainListStyle())

          Button {

          } label: {
            APButton(title: "Place Order")
          }
          .padding(.bottom, 25)
        }
          .navigationTitle("Order")
      }
    }

  //MARK: - View Methods
  func deleteItems(at offsets: IndexSet) {
    order.remove(atOffsets: offsets)
  }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
