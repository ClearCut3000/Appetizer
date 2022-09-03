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

struct AppetizerRequest: Decodable {
  let request: [Appetizer]
}

struct MockData {
  static let sampleAppetizer = Appetizer(id: 1,
                                         name: "Sample Appetizer",
                                         description: "Sample description",
                                         price: 99.99,
                                         imageURL: "",
                                         calories: 88,
                                         protein: 77,
                                         carbs: 109)
  static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer]

  static let mockOrder = [
    Appetizer(id: 1,
              name: "Sample One",
              description: "Sample one",
              price: 9.99, imageURL: "",
              calories: 23, protein: 44,
              carbs: 55),
    Appetizer(id: 2,
              name: "Sample Two",
              description: "Sample two",
              price: 19.09, imageURL: "",
              calories: 33, protein: 22,
              carbs: 77),
    Appetizer(id: 3,
              name: "Sample Three",
              description: "Sample three",
              price: 29.39, imageURL: "",
              calories: 99,
              protein: 11,
              carbs: 88)
  ]
}
