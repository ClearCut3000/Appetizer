//
//  Alert.swift
//  Appetizer
//
//  Created by Николай Никитин on 31.08.2022.
//

import SwiftUI

struct AlertItem: Identifiable {
  let id = UUID()
  let title: Text
  let message: Text
  let dismissButton: Alert.Button
}

struct AlertContext {
  static let invalidURL = AlertItem(title: Text("Server error!"),
                                       message: Text("Incorrect URL address!"),
                                       dismissButton: .default(Text("OK")))
  static let invalidResponse = AlertItem(title:Text("Server error!"),
                                            message: Text("The server response is corrupted!"),
                                            dismissButton: .default(Text("OK")))
  static let invalidData = AlertItem(title: Text("Server error!"),
                                      message: Text("The received data could not be decoded!"),
                                      dismissButton: .default(Text("OK")))
  static let unableToComplete = AlertItem(title: Text("Server error!"),
                                       message: Text("Failed to complete the request. Check your internet connection!"),
                                       dismissButton: .default(Text("OK")))
}
