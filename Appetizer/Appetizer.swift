//
//  Appetizer.swift
//  Appetizer
//
//  Created by Николай Никитин on 30.08.2022.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
  let id: Int
  let name: String
  let description: String
  let price: Double
  let imageURL: String
  let calories: Int
  let protein: Int
  let carbs: Int
}

struct AppetizerRequest {
  let request: [Appetizer]
}

struct MockData {
  static let sampleAppetizer = Appetizer(id: 1,
                                         name: "Sample Appetizer",
                                         description: "Sample description",
                                         price: 99.99,
                                         imageURL: "",
                                         calories: 100,
                                         protein: 100,
                                         carbs: 100)
  static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer]
}