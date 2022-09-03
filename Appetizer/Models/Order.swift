//
//  Order.swift
//  Appetizer
//
//  Created by Николай Никитин on 03.09.2022.
//

import SwiftUI

final class Order: ObservableObject {

  //MARK: - Properties
  @Published var items: [Appetizer] = []
  var totalPrice: Double {
    items.reduce(0) { $0 + $1.price }
  }

  //MARK: - Methods
  func add(_ appetizer: Appetizer) {
    items.append(appetizer)
  }

  func delete(at offsets: IndexSet) {
    items.remove(atOffsets: offsets)
  }
}
